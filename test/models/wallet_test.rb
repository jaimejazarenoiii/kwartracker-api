# frozen_string_literal: true

# == Schema Information
#
# Table name: wallets
#
#  id          :bigint           not null, primary key
#  currency    :integer          not null
#  target_date :datetime
#  title       :string           not null
#  total       :float
#  type        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class WalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
