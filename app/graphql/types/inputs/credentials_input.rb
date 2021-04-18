# frozen_string_literal: true

module Types
  module Inputs
    class CredentialsInput < BaseInputObject
      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
