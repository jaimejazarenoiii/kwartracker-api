# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  age                    :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  gender                 :integer
#  last_name              :string           not null
#  middle_name            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable
  enum gender: %i[male female]
  validates :email, presence: true, uniqueness: true
  validates :first_name, :middle_name, :last_name, length: { maximum: 20 }
  validates :age, inclusion: 13..100
  validates :password, :password_confirmation, presence: true, length: { in: 8..15 }
  validates :password, confirmation: true
  validates_format_of :email, with: Devise.email_regexp
end
