require 'faker'
FactoryBot.define do
  password = Faker::Internet.password(min_length: 8, max_length: 15)
  factory :user do
    first_name { Faker::Name.first_name }
    middle_name{ Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    age { 14 }
    gender { 0 }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
