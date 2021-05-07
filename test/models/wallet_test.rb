# frozen_string_literal: true

# == Schema Information
#
# Table name: wallets
#
#  id           :bigint           not null, primary key
#  category     :integer          not null
#  currency     :integer          not null
#  target_date  :datetime
#  target_total :float
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
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
    @wallet = build(:normal_wallet)
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
