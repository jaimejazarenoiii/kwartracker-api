# frozen_string_literal: true

# == Schema Information
#
# Table name: imageables
#
#  id             :bigint           not null, primary key
#  imageable_type :string           not null
#  picture        :string
#  type           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_imageables_on_imageable  (imageable_type,imageable_id)
#
FactoryBot.define do
  factory :imageable do
    picture { 'MyString' }
    type { 1 }
    imageable { nil }
  end
end
