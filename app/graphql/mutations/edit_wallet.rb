# frozen_string_literal: true

module Mutations
  class EditWallet < BaseMutation
    description 'Edit wallet'
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :currency, Integer, required: true

    type ::Types::Payloads::WalletType

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::EditWallet.call(params)
      result.success? ? result.wallet : execution_error(message: result.error)
    end
  end
end
