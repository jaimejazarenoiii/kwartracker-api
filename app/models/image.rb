# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id             :bigint           not null, primary key
#  imageable_type :string
#  type           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint
#
# Indexes
#
#  index_images_on_imageable  (imageable_type,imageable_id)
#
class Image < ApplicationRecord
  enum type: %i[photo]
  belongs_to :imageable, polymorphic: true
  has_one_attached :picture
end
