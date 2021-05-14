# frozen_string_literal: true

module Types
  module Payloads
    class CategoryGroupType < Types::BaseObject
      description 'Category group details'

      field :id, ID, null: false
      field :title, String, null: true
      field :categories, [Types::Payloads::CategoryType], null: true
    end
  end
end
