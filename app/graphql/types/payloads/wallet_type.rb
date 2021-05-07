# frozen_string_literal: true

module Types
  module Payloads
    class WalletType < Types::BaseObject
      description 'Wallet details'

      field :id, ID, null: false
      field :title, String, null: false
      field :currency, String, null: false
      field :category, String, null: false
      field :target_total, Float, null: true
      field :target_date, GraphQL::Types::ISO8601Date, null: true
    end
  end
end
