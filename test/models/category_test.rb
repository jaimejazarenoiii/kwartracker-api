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
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @group = create(:category_group)
    @category = @group.categories.first
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
