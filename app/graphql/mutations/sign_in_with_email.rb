# frozen_string_literal: true

module Mutations
  class SignInWithEmail < BaseMutation
    description 'Sign in user'
    argument :credentials, Types::Inputs::CredentialsInput, required: true

    type ::Types::Payloads::AuthenticatedUserType

    def resolve(**params)
      result = ::Organizers::SignInWithEmail.call(params)
      result.success? ? result : execution_error(message: result.error)
    end
  end
end
