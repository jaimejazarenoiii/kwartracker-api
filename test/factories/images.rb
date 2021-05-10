# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id             :bigint           not null, primary key
#  imageable_type :string           not null
#  type           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_images_on_imageable  (imageable_type,imageable_id)
#
FactoryBot.define do
  factory :image do
    type { 0 }
  end
end
