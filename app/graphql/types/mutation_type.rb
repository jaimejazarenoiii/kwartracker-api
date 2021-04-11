# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_up_with_email, mutation: Mutations::SignUpWithEmail
  end
end
