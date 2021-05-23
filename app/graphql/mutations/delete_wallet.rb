# frozen_string_literal: true

module Mutations
  class DeleteWallet < BaseMutation
    description 'Delete wallet'
    argument :id, ID, required: true

    type [::Types::Payloads::WalletType]

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::DeleteWallet.call(params)
      result.success? ? result.wallets : execution_error(message: result.error)
    end
  end
end
