# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class EditCategoryTest < MiniTest::Test
      def test_valid_save
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user
        @params[:category] = user.categories.first
        @params[:category_group_id] = user.category_groups.first.id

        result = EditCategory.call(@params)

        assert result.success?
      end

      def test_invalid_title
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user
        @params[:title] = nil
        @params[:category] = user.categories.first
        @params[:category_group_id] = user.category_groups.first.id

        result = EditCategory.call(@params)

        refute result.success?
      end

      def test_invalid_category_group_id
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user
        @params[:title] = 'Test Edit Category'
        @params[:category] = user.categories.first
        @params[:category_group_id] = nil

        result = EditCategory.call(@params)

        refute result.success?
      end

      private

      def before_all
        @password = Faker::Internet.password(min_length: 8, max_length: 15)
        @email = Faker::Internet.email
        set_params
      end

      def set_params
        @params = {
          title: Faker::Name.first_name
        }
      end
    end
  end
end
