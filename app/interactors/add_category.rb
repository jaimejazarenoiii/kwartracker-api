# frozen_string_literal: true

# app/interactors/add_category.rb
class AddCategory
  include Interactor

  def call
    @current_user = context.current_user
    @category = @current_user.categories.new
    apply_category_params
    create_category
  end

  private

  def apply_category_params
    @category.title = context.title
    @category.category_group_id = context.category_group_id
  end

  def create_category
    context.fail!(error: @category.errors.full_messages.to_sentence) unless @category.save
    context.category = @category
  end
end
