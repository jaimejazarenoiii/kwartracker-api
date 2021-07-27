# frozen_string_literal: true

# app/interactors/add_category_group.rb
class AddCategoryGroup
  include Interactor

  def call
    current_user = context.current_user
    @category_group = current_user.category_groups.new
    apply_category_group_params
    create_category_group
  end

  private

  def apply_category_group_params
    @category_group.title = context.title
  end

  def create_category_group
    context.fail!(error: @category_group.errors.full_messages.to_sentence) unless @category_group.save
    context.category_group = @category_group
  end
end
