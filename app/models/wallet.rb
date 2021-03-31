# == Schema Information
#
# Table name: wallets
#
#  id          :bigint           not null, primary key
#  currency    :integer
#  target_date :datetime
#  title       :string
#  total       :float
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Wallet < ApplicationRecord
	enum gender: %i[type1 type2]
	validates :title, presence: true, uniqueness: true
end
