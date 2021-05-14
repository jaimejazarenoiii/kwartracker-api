# frozen_string_literal: true

module Resolvers
  class UserProfileResolver < GraphQL::Schema::Resolver
    description 'Current user profile'

    type Types::Payloads::UserType, null: true

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve
      context[:current_user]
    end
  end
end
