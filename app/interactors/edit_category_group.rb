# frozen_string_literal: true

# app/interactors/edit_category_group.rb
class EditCategoryGroup
  include Interactor

  def call
    @category_group = context[:category_group]
    @category_group.title = context[:title]
    context[:category_group] = @category_group
    save_category_group
  end

  private

  def save_category_group
    context.fail!(error: @category_group.errors.full_messages.to_sentence) unless @category_group.save
  end
end
