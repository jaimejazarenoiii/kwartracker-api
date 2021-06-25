# frozen_string_literal: true

module Mutations
  class DeleteCategory < BaseMutation
    description 'Delete category'
    argument :id, ID, required: true

    type [::Types::Payloads::CategoryType]

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::DeleteCategory.call(params)
      result.success? ? result.categories : execution_error(message: result.error)
    end
  end
end
