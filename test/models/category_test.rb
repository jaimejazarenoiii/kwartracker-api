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
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = build(:category)
  end

  test 'invalid title' do
    expected_err_mssg = 'Title can\'t be blank'
    @category.title = ''
    refute @category.valid?
    assert_equal @category.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'vaid category' do
    assert @category.save
  end
end
