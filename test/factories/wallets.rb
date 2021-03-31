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
FactoryBot.define do
  factory :wallet do
    title { "MyString" }
    type { "" }
    currency { 1 }
    total { 1.5 }
    target_date { "2021-03-31 05:43:26" }
  end
end
