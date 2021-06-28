# frozen_string_literal: true

module Resolvers
  class TransactionsResolver < GraphQL::Schema::Resolver
    description 'Find all transactions'

    type [Types::Payloads::TransactionType], null: true

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve
      context[:current_user].transactions
    end
  end
end
