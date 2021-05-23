# frozen_string_literal: true

# app/interactors/find_wallet.rb
class DeleteWallet
  include Interactor

  def call
    @current_user = context[:current_user]
    @wallet = context[:wallet]
    delete_wallet
    context[:wallets] = @current_user.wallets
  end

  private

  def delete_wallet
    @wallet.delete
  end
end
