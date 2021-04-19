# frozen_string_literal: true

# == Schema Information
#
# Table name: wallets
#
#  id          :bigint           not null, primary key
#  currency    :integer          not null
#  target_date :datetime
#  title       :string           not null
#  total       :float
#  type        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class WalletTest < ActiveSupport::TestCase
  setup do
    @wallet = build(:wallet)
  end

  test 'invalid empty title' do
    assert_not @wallet.valid?
  end

  test 'invalid empty type' do
    @wallet.title = 'Title'
    assert_not @wallet.valid?
  end

  test 'save wallet' do
    @wallet.title = 'Title'
    @wallet.type = 'type'
    assert @wallet.save
  end
end
