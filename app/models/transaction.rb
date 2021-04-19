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
class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :imageable

  enum frequency: %i[day week month]
  validates :title, :amount, :datetime, presence: true
end
