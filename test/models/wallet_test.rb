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
require "test_helper"

class WalletTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
