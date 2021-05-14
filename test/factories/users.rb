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
require 'faker'
FactoryBot.define do
  password = Faker::Internet.password(min_length: 8, max_length: 15)
  factory :user do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    age { 14 }
    gender { 0 }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }

    after(:create) do |user|
      create(:wallet, user: user)
      create(:category_group, user: user)
      user.reload
    end
  end
end
