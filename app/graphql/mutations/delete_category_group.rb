# frozen_string_literal: true

module Mutations
  class DeleteCategoryGroup < BaseMutation
    description 'Delete Category Group'
    argument :id, ID, required: true

    type [::Types::Payloads::CategoryGroupType]

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].present?
    end

    def resolve(**params)
      params[:current_user] = context[:current_user]
      result = ::Organizers::DeleteCategoryGroup.call(params)
      result.success? ? result.category_groups : execution_error(message: result.error)
    end
  end
end
