# frozen_string_literal: true

module Mutations
  class AddCategoryGroup < BaseMutation
    description 'Add Category Group'
    argument :title, String, required: true

    type ::Types::Payloads::CategoryGroupType

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::AddCategoryGroup.call(params)
      result.success? ? result.category_group : execution_error(message: result.error)
    end
  end
end
