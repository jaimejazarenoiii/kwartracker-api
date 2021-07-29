# frozen_string_literal: true

# app/interactors/edit_category.rb
class EditCategory
  include Interactor

  def call
    @category = context[:category]
    @category.title = context[:title]
    @category.category_group_id = context[:category_group_id]
    context[:category] = @category
    save_category_group
  end

  private

  def save_category_group
    context.fail!(error: @category.errors.full_messages.to_sentence) unless @category.save
  end
end
