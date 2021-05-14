# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id                :bigint           not null, primary key
#  title             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_group_id :bigint
#
# Indexes
#
#  index_categories_on_category_group_id  (category_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_group_id => category_groups.id)
#
class Category < ApplicationRecord
  validates :title, presence: true

  belongs_to :group, class_name: 'CategoryGroup', foreign_key: 'category_group_id'
  has_many :budgets
  has_many :transactions
end
