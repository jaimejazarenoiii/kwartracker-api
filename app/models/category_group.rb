# frozen_string_literal: true

# == Schema Information
#
# Table name: category_groups
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_category_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class CategoryGroup < ApplicationRecord
  DEFAULT_GROUPS = %i[health bills home gifts fun].freeze
  validates :title, presence: true
  has_many :categories
  belongs_to :user
end
