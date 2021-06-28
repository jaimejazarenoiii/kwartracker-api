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
#  wallet_id      :bigint
#
# Indexes
#
#  index_transactions_on_category_id  (category_id)
#  index_transactions_on_wallet_id    (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :transaction do
    title { Faker::Name.first_name }
    amount { 1.5 }
    wallet_id { 1 }
    datetime { '2021-04-14 20:47:33' }
    recurring { false }
    frequency { 1 }
    frequence_date { '2021-04-14 20:47:33' }
    with { Faker::Name.first_name }
  end
end
