# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id             :bigint           not null, primary key
#  amount         :float            not null
#  datetime       :datetime         not null
#  frequence_date :string
#  frequency      :integer
#  recurring      :boolean
#  title          :string           not null
#  with           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :integer          not null
#  photo_id       :integer
#  wallet_id      :integer          not null
#
require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  setup do
    # create image
    # create wallet
  end

  test 'valid transaction' do
    assert true
  end

  test 'invalid title' do
    assert true
  end

  test 'invalid amount' do
    assert true
  end

  test 'invalid datetime' do
    assert true
  end
end
