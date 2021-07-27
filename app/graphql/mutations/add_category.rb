# frozen_string_literal: true

module Mutations
  class AddCategory < BaseMutation
    description 'Add Category'
    argument :title, String, required: true
    argument :category_group_id, ID, required: true

    type ::Types::Payloads::CategoryType

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::AddCategory.call(params)
      result.success? ? result.category : execution_error(message: result.error)
    end
  end
end
