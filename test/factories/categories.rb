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
FactoryBot.define do
  factory :category do
    title { Faker::Name.first_name }

    after(:create) do |category|
      create(:budget, category: category)

      category.reload
    end
  end
end
