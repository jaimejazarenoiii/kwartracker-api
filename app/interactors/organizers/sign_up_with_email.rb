# frozen_string_literal: true

module Organizers
  class SignUpWithEmail
    include Interactor::Organizer

    organize ::ValidateSignUpWithEmailParams, ::GenerateToken
  end
end
