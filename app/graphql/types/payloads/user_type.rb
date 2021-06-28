# frozen_string_literal: true

module Types
  module Payloads
    class UserType < Types::BaseObject
      description 'User details'

      field :id, ID, null: false
      field :email, String, null: false
      field :first_name, String, null: false
      field :middle_name, String, null: true
      field :last_name, String, null: false
      field :gender, String, null: true
      field :age, Integer, null: true
    end
  end
end
