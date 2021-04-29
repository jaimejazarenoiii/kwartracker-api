# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_in_with_email, mutation: Mutations::SignInWithEmail
    field :sign_up_with_email, mutation: Mutations::SignUpWithEmail
  end
end
