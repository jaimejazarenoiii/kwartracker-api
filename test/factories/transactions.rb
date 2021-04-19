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
