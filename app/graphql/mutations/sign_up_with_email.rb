# frozen_string_literal: true

# app/graphql/mutations/sign_up_with_email.rb
module Mutations
  class SignUpWithEmail < Mutations::BaseMutation
    description 'Sign up user using email and password credentials'

    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confrimation, String, required: true
    argument :profile, Types::Inputs::ProfileInput, required: true

    type ::Types::Payloads::AuthenticatedUserType

    def resolve(**params)
      result = ::SignUpWithEmail.call(params)
      result.success? ? result : execution_error(message: result.error)
    end
  end
end
