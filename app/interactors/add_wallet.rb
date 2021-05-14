# frozen_string_literal: true

# app/interactors/add_wallet.rb
class AddWallet
  include Interactor

  def call
    @current_user = context.current_user
    @wallet = @current_user.wallets.new
    apply_wallet_params
    create_first_transaction
  end

  private

  def apply_wallet_params
    @wallet.title = context.title
    @wallet.currency = context.currency
  end

  # rubocop:disable Metrics/AbcSize
  def create_first_transaction
    @category = @current_user.to_be_budgeted_category
    context.fail!(error: @wallet.errors.full_messages.to_sentence) unless @wallet.save
    @transaction = @wallet.transactions.new(transaction_param(category: @category))
    context.fail!(error: @transaction.errors.full_messages.to_sentence) unless @transaction.save
    context.wallet = @wallet
  end
  # rubocop:enable Metrics/AbcSize

  def transaction_param(category:)
    {
      title: 'Initial money',
      amount: context.amount,
      category: category
    }
  end
end
