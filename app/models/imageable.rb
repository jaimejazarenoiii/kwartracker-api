# == Schema Information
#
# Table name: imageables
#
#  id         :bigint           not null, primary key
#  image      :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Imageable < ApplicationRecord
	validates :image, presence: true, uniqueness: true
	enum type: %i[type1 type2 type3]
end
