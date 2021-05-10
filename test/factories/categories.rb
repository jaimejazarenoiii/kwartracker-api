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
FactoryBot.define do
  factory :category do
    title { 'Category One' }
  end
end
