# frozen_string_literal: true

module Types
  module Payloads
    class CategoryType < Types::BaseObject
      description 'Category details'

      field :id, ID, null: false
      field :title, String, null: true
      field :transactions, [Types::Payloads::TransactionType], null: false
      field :budgets, [Types::Payloads::BudgetType], null: false
    end
  end
end
