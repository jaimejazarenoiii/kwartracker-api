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
class Transaction < ApplicationRecord
  belongs_to :wallet
  has_one :category
  has_one :image
  enum frequency: %i[day week month]
  validates :title, :amount, :datetime, presence: true
end
