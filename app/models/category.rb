# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#
# Indexes
#
#  index_categories_on_parent_id  (parent_id)
#
class Category < ApplicationRecord
  has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional: true
  has_many :transactions
  has_many :wallets, through: :transactions
  validates :title, presence: true, uniqueness: true
end
