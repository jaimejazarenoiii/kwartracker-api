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
require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @group = @user.category_groups.first
    @category = @group.categories.first
    @wallet = build(:wallet)
    @transaction = build(:transaction)
    @image = build(:image)
  end

  test 'invalid imageable' do
    expected_err_mssg = 'Imageable must exist'
    refute @image.valid?
    assert_equal @image.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'vaid image' do
    assert @user.save

    @wallet.user = @user
    assert @wallet.save

    assert @category.save

    @transaction.wallet_id = @wallet.id
    @transaction.category_id = @category.id
    @image.imageable = @transaction
    assert @image.save
  end
end
