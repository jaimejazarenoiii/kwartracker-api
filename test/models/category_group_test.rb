# frozen_string_literal: true

# == Schema Information
#
# Table name: category_groups
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_category_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class CategoryGroupTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @group = @user.category_groups.first
  end

  test 'invalid title' do
    expected_err_mssg = 'Title can\'t be blank'
    @group.title = ''
    refute @group.valid?
    assert_equal @group.errors.full_messages.to_sentence, expected_err_mssg
  end
end
