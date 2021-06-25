# frozen_string_literal: true

class DeleteCategory
  include Interactor

  def call
    @current_user = context[:current_user]
    @category = context[:category]
    delete_category
    context[:categories] = @current_user.categories
  end

  private

  def delete_category
    @category.destroy
  end
end
