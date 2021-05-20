# frozen_string_literal: true

# app/interactors/edit_wallet.rb
class EditWallet
  include Interactor

  def call
    @wallet = context[:wallet]
    @wallet.title = context[:title]
    @wallet.currency = context[:currency]
    context[:wallet] = @wallet
    save_wallet
  end

  private

  def save_wallet
    context.fail!(error: @wallet.errors.full_messages.to_sentence) unless @wallet.save
  end
end
