# frozen_string_literal: true

module Resolvers
  class CategoryGroupsResolver < GraphQL::Schema::Resolver
    description 'Find all wallets'

    type [Types::Payloads::CategoryGroupType], null: true

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve
      context[:current_user].category_groups
    end
  end
end
