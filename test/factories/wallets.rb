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
FactoryBot.define do
  factory :normal_wallet, class: Wallet do
    title { 'MyString' }
    category { 0 }
    currency { 1 }
  end

  factory :goal_wallet, class: Wallet do
    title { 'MyString' }
    category { 1 }
    currency { 1 }
    target_total { 100_000 }
    target_date { 'Sat, 17 Dec 2022 00:00:00 +0000' }
  end
end
