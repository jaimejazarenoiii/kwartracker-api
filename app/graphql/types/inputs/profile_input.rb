# frozen_string_literal: true

module Types
  module Inputs
    class ProfileInput < BaseInputObject
      description 'Arguments for user profile'

      argument :first_name, String, required: true
      argument :middle_name, String, required: false
      argument :last_name, String, required: true
      argument :gender, Integer, required: true
      argument :age, Integer, required: true
    end
  end
end
