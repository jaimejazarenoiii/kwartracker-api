# frozen_string_literal: true

# == Schema Information
#
# Table name: imageables
#
#  id         :bigint           not null, primary key
#  image      :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :imageable do
    image { 'MyString' }
    type { 1 }
  end
end
