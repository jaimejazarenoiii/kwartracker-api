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
FactoryBot.define do
  factory :budget do
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
