# frozen_string_literal: true

module Types
  module Payloads
    class BudgetType < Types::BaseObject
      description 'Budget details'

      field :id, ID, null: false
      field :amount, Float, null: true
      field :category, Types::Payloads::CategoryType, null: false
    end
  end
end
