# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  age                    :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  gender                 :integer
#  last_name              :string           not null
#  middle_name            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = build(:user)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid email' do
    @user.email = Faker::Name.first_name
    refute @user.valid?
    assert_equal @user.errors.full_messages.to_sentence, 'Email is invalid'
  end

  test 'invalid first name' do
    @user.first_name = Random.new(30)
    expected_err_mssg = 'First name is too long (maximum is 20 characters)'
    refute @user.valid?
    assert_equal @user.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'valid empty middle name' do
    @user.middle_name = ''
    assert @user.valid?
  end

  test 'invalid last name' do
    @user.last_name = Random.new(30)
    expected_err_mssg = 'Last name is too long (maximum is 20 characters)'
    refute @user.valid?
    assert_equal @user.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'valid age range' do
    @user.age = Random.new.rand(13..100)
    assert @user.valid?
  end

  test 'invalid age' do
    @user.age = 9
    expected_err_mssg = 'Age is not included in the list'
    refute @user.valid?
    @user.age = 1000
    refute @user.valid?
    assert_equal @user.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'invalid password length' do
    password = 'test'
    @user.password = password
    @user.password_confirmation = password
    expected_err_mssg = 'Password is too short (minimum is 8 characters) and Password confirmation is too short (minimum is 8 characters)' # rubocop:disable Layout/LineLength
    refute @user.valid?
    assert_equal @user.errors.full_messages.to_sentence, expected_err_mssg
  end

  test 'invalid password confirmation' do
    @user.password_confirmation = 'Password'
    expected_err_mssg = "Password confirmation doesn't match Password"
    refute @user.valid?
    assert_equal @user.errors.full_messages.to_sentence, expected_err_mssg
  end
end
