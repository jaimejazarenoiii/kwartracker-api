# frozen_string_literal: true

# == Schema Information
#
# Table name: wallets
#
#  id         :bigint           not null, primary key
#  currency   :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_wallets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class WalletTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    @wallet = build(:wallet)
  end

  test 'invalid empty title' do
    assert_not @wallet.valid?
  end

  test 'invalid empty category' do
    @wallet.title = 'Title'
    assert_not @wallet.valid?
  end

  test 'save wallet' do
    @wallet.title = 'Title'
    @wallet.user = @user
    assert @wallet.save
  end
end
