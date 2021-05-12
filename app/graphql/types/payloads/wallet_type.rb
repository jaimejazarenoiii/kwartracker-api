# frozen_string_literal: true

module Types
  module Payloads
    class WalletType < Types::BaseObject
      description 'Wallet details'

      field :id, ID, null: false
      field :title, String, null: false
      field :currency, String, null: false
      field :transactions, [Types::Payloads::TransactionType], null: true
    end
  end
end
