# frozen_string_literal: true

# == Schema Information
#
# Table name: wallets
#
#  id         :bigint           not null, primary key
#  currency   :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
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
  factory :wallet do
    title { Faker::Name.first_name }
    currency { 1 }
    after(:create) do |wallet|
      create(:transaction, wallet: wallet, category: wallet.user.to_be_budgeted_category)
      wallet.reload
    end
  end
end
