# frozen_string_literal: true

class Transaction < ApplicationRecord
  enum frequency: %i[day week month]
  validates :title, :amount, :datetime, presence: true
end
