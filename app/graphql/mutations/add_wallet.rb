# frozen_string_literal: true

module Mutations
  class AddWallet < BaseMutation
    description 'Sign in user'
    argument :title, String, required: true
    argument :currency, Integer, required: true
    argument :amount, Float, required: true

    type ::Types::Payloads::WalletType

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::AddWallet.call(params)
      result.success? ? result.wallet : execution_error(message: result.error)
    end
  end
end
