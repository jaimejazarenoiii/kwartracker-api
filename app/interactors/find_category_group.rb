# frozen_string_literal: true

# app/interactors/find_category_group.rb
class FindCategoryGroup
  include Interactor

  def call
    @current_user = context[:current_user]
    find_category_group
  end

  private

  def find_category_group
    context[:category_group] = @current_user.category_groups.find_by_id(context[:id])
    context.fail!(error: 'Record not found.') if context[:category_group].nil?
  end
end
