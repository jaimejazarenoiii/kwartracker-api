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
# rubocop:disable Metrics/ClassLength
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable
  enum gender: %i[male female]
  validates :email, presence: true, uniqueness: true
  validates :first_name, :middle_name, :last_name, length: { maximum: 20 }
  validates :age, inclusion: { in: 13..100, message: '%<value>s is not a valid age', allow_nil: true }
  validates :password, :password_confirmation, presence: true, length: { in: 8..15 }, on: :create
  validates :password, confirmation: true, on: :create
  validates_format_of :email, with: Devise.email_regexp

  has_many :wallets, dependent: :destroy
  has_many :category_groups, dependent: :destroy
  has_many :categories, through: :category_groups
  has_many :transactions, through: :wallets

  after_create :create_preset_categories

  def to_be_budgeted_category
    category_groups.first.categories.first
  end

  private

  def create_preset_categories
    create_to_be_budgeted_category
    create_default_groups
  end

  # rubocop:disable Metrics/MethodLength
  def create_default_groups
    CategoryGroup::DEFAULT_GROUPS.each do |group|
      case group
      when :health
        create_health_group
      when :bills
        create_bills_group
      when :home
        create_home_group
      when :gifts
        create_gifts_group
      when :fun
        create_fun_group
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def create_health_group
    group = category_groups.new
    group.title = CategoryGroup::DEFAULT_GROUPS[0].to_s.split('_').map(&:capitalize).join(' ')
    group.save
    create_health_categories(group: group)
  end

  def create_bills_group
    group = category_groups.new
    group.title = CategoryGroup::DEFAULT_GROUPS[1].to_s.split('_').map(&:capitalize).join(' ')
    group.save
    create_bills_categories(group: group)
  end

  def create_home_group
    group = category_groups.new
    group.title = CategoryGroup::DEFAULT_GROUPS[2].to_s.split('_').map(&:capitalize).join(' ')
    group.save
    create_home_categories(group: group)
  end

  def create_gifts_group
    group = category_groups.new
    group.title = CategoryGroup::DEFAULT_GROUPS[3].to_s.split('_').map(&:capitalize).join(' ')
    group.save
    create_gifts_categories(group: group)
  end

  def create_fun_group
    group = category_groups.new
    group.title = CategoryGroup::DEFAULT_GROUPS[4].to_s.split('_').map(&:capitalize).join(' ')
    group.save
    create_fun_categories(group: group)
  end

  def create_to_be_budgeted_category
    group = category_groups.new
    group.title = 'To be budgeted'
    group.save
    category = group.categories.new
    category.title = 'To be budgeted'
    category.save
  end

  def create_health_categories(group:)
    Category::DEFAULT_HEALTH_CATEGORIES.each do |cat|
      category = group.categories.new
      category.title = cat.to_s.split('_').map(&:capitalize).join(' ')
      category.save
    end
  end

  def create_bills_categories(group:)
    Category::DEFAULT_BILLS_CATEGORIES.each do |cat|
      category = group.categories.new
      category.title = cat.to_s.split('_').map(&:capitalize).join(' ')
      category.save
    end
  end

  def create_home_categories(group:)
    Category::DEFAULT_HOME_CATEGORIES.each do |cat|
      category = group.categories.new
      category.title = cat.to_s.split('_').map(&:capitalize).join(' ')
      category.save
    end
  end

  def create_gifts_categories(group:)
    Category::DEFAULT_GIFTS_CATEGORIES.each do |cat|
      category = group.categories.new
      category.title = cat.to_s.split('_').map(&:capitalize).join(' ')
      category.save
    end
  end

  def create_fun_categories(group:)
    Category::DEFAULT_FUN_CATEGORIES.each do |cat|
      category = group.categories.new
      category.title = cat.to_s.split('_').map(&:capitalize).join(' ')
      category.save
    end
  end
end
# rubocop:enable Metrics/ClassLength
