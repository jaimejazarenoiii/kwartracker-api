# frozen_string_literal: true

# == Schema Information
#
# Table name: budgets
#
#  id          :bigint           not null, primary key
#  amount      :float            default(0.0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_budgets_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @group = @user.category_groups.first
    @budget = @group.categories.first.budgets.first
  end

  test 'save budget' do
    @budget.amount = 999
    assert @budget.save
  end
end
