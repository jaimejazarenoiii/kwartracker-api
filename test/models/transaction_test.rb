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
#  category_id    :bigint           not null
#  wallet_id      :bigint           not null
#
# Indexes
#
#  index_transactions_on_category_id  (category_id)
#  index_transactions_on_wallet_id    (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (wallet_id => wallets.id)
#
require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  setup do
    @user = build(:user)
    @category = build(:category)
    @wallet = build(:normal_wallet)
    @transaction = build(:transaction)
  end

  test 'invalid title' do
    expected_err_mssg = 'Title can\'t be blank'
    @transaction.title = ''
    @user.save
    @wallet.user = @user
    @wallet.save
    @transaction.wallet_id = @wallet.id
    refute @transaction.valid?
    assert_equal @transaction.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'invalid wallet' do
    expected_err_mssg = 'Wallet must exist'
    refute @transaction.valid?
    assert_equal @transaction.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'invalid amount' do
    expected_err_mssg = 'Amount must be greater than 0'
    @transaction.amount = 0
    @user.save
    @wallet.user = @user
    @wallet.save
    @transaction.wallet_id = @wallet.id
    refute @transaction.valid?
    assert_equal @transaction.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'invalid datetime' do
    expected_err_mssg = 'Datetime can\'t be blank'
    @transaction.datetime = ''
    @user.save
    @wallet.user = @user
    @wallet.save
    @transaction.wallet_id = @wallet.id
    refute @transaction.valid?
    assert_equal @transaction.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'valid transaction' do
    assert @user.save

    @wallet.user = @user
    assert @wallet.save

    assert @category.save

    @transaction.wallet_id = @wallet.id
    @transaction.category_id = @category.id
    assert @transaction.save
  end
end
