# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :bigint           not null
#  parent_id  :bigint
#
# Indexes
#
#  index_categories_on_image_id   (image_id)
#  index_categories_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#
class Category < ApplicationRecord
  has_many :categories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :manager, class_name: 'Category', foreign_key: 'parent_id'
  has_one :image
  validates :title, presence: true, uniqueness: true
end
