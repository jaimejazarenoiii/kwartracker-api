# frozen_string_literal: true

module Types
  module Payloads
    class AuthenticatedUserType < Types::BaseObject
      description 'Payload for authenticated user'

      field :token, String, null: false
      field :user, Types::UserType, null: false
    end
  end
end
