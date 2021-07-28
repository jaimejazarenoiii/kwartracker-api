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
  DEFAULT_HEALTH_CATEGORIES = %i[hospital medicine personal_care].freeze
  DEFAULT_BILLS_CATEGORIES = %i[electricity phone internet water rental].freeze
  DEFAULT_HOME_CATEGORIES = %i[maintenance groceries water rental].freeze
  DEFAULT_GIFTS_CATEGORIES = %i[donation marriage birthday funeral].freeze
  DEFAULT_FUN_CATEGORIES = %i[vices games].freeze
  validates :title, presence: true

  belongs_to :group, class_name: 'CategoryGroup', foreign_key: 'category_group_id'
  has_many :budgets
  has_many :transactions, dependent: :destroy
end
