# frozen_string_literal: true

module Types
  module Payloads
    class TransactionType < Types::BaseObject
      description 'Transaction details'

      field :id, ID, null: false
      field :title, String, null: true
      field :amount, Float, null: false
      field :datetime, GraphQL::Types::ISO8601Date, null: false
      field :category, Types::Payloads::CategoryType, null: true
      field :wallet, Types::Payloads::WalletType, null: false
    end
  end
end
