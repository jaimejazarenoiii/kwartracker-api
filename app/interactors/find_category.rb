# frozen_string_literal: true

class FindCategory
  include Interactor

  def call
    @current_user = context[:current_user]
    find_category
  end

  private

  def find_category
    context[:category] = @current_user.categories.find_by_id(context[:id])
    context.fail!(error: 'Record not found.') if context[:category].nil?
  end
end
