# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :wallets, resolver: ::Resolvers::WalletsResolver
    field :profile, resolver: ::Resolvers::UserProfileResolver
    field :category_groups, resolver: ::Resolvers::CategoryGroupsResolver
    field :transactions, resolver: ::Resolvers::TransactionsResolver
  end
end
