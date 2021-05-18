# frozen_string_literal: true

# app/interactors/find_wallet.rb
class FindWallet
  include Interactor

  def call
    @current_user = context[:current_user]
    find_wallet
  end

  private

  def find_wallet
    context[:wallet] = @current_user.wallets.find_by_id(context[:id])
    context.fail!('Record not found.') if context[:wallet].nil?
  end
end
