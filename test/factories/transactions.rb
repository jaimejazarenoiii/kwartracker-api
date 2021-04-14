# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    title { 'MyString' }
    category_id { 1 }
    amount { 1.5 }
    wallet_id { 1 }
    datetime { '2021-04-14 20:47:33' }
    recurring { false }
    frequency { 'MyString' }
    frequence_date { 'MyString' }
    with { 'MyString' }
    photo_id { 1 }
  end
end
