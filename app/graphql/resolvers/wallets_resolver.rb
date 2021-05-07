# frozen_string_literal: true

module Resolvers
  class WalletsResolver < GraphQL::Schema::Resolver
    description 'Find all wallets'

    type [Types::Payloads::WalletType], null: true

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve
      context[:current_user].wallets
    end
  end
end
