# frozen_string_literal: true

# app/graphql/mutations/update_profile.rb
module Mutations
  class UpdateProfile < Mutations::BaseMutation
    description 'Update current user profile'

    argument :first_name, String, required: true
    argument :middle_name, String, required: false
    argument :last_name, String, required: true
    argument :gender, Integer, required: true
    argument :age, Integer, required: true

    type ::Types::Payloads::UserType

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::UpdateProfile.call(params)
      result.success? ? result.user : execution_error(message: result.error)
    end
  end
end
