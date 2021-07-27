# frozen_string_literal: true

# app/interactors/delete_category_group.rb
class DeleteCategoryGroup
  include Interactor

  def call
    current_user = context[:current_user]
    @category_group = context[:category_group]
    delete_category_group
    context[:category_groups] = current_user.category_groups
  end

  private

  def delete_category_group
    @category_group.delete
  end
end
