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
  validates :age, inclusion: { in: 13..100, message: '%<value>s is not a valid age' }
  validates :password, :password_confirmation, presence: true, length: { in: 8..15 }
  validates :password, confirmation: true
  validates_format_of :email, with: Devise.email_regexp

  has_many :wallets
  has_many :category_groups
  has_many :categories, through: :category_groups

  after_create :create_to_be_budgeted_category

  def to_be_budgeted_category
    category_groups.first.categories.first
  end

  private

  def create_to_be_budgeted_category
    group = category_groups.new
    group.title = 'To be budgeted'
    group.save
    category = group.categories.new
    category.title = 'To be budgeted'
    category.save
  end
end
