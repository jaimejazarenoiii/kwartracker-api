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
#  image_id       :bigint           not null
#  wallet_id      :bigint           not null
#
# Indexes
#
#  index_transactions_on_category_id  (category_id)
#  index_transactions_on_image_id     (image_id)
#  index_transactions_on_wallet_id    (wallet_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (image_id => images.id)
#  fk_rails_...  (wallet_id => wallets.id)
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
