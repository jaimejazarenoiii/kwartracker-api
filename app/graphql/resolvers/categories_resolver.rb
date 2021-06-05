# frozen_string_literal: true

module Resolvers
  class CategoriesResolver < GraphQL::Schema::Resolver
    description 'Find all categories'

    type [Types::Payloads::CategoryType], null: true

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve
      context[:current_user].categories
    end
  end
end
