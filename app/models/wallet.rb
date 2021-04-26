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
class Wallet < ApplicationRecord
  enum currency: %i[php usd]
  enum category: %i[normal goal budget]
  validates :title, presence: true, uniqueness: true
  validates :category, :currency, presence: true

  belongs_to :user
end
