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
class Budget < ApplicationRecord
  belongs_to :category
end
