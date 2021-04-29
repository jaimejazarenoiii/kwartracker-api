# frozen_string_literal: true

module Organizers
  class SignInWithEmail
    include Interactor::Organizer

    organize ValidateSignInWithEmailParams, GenerateToken
  end
end
