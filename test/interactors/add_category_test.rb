# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class AddCategoryTest < MiniTest::Test
      def test_valid_save
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user

        category_group = FactoryBot.create(:category_group, title: @title, user_id: user.id)
        @params[:category_group_id] = category_group.id

        result = ::Organizers::AddCategory.call(@params)
        assert result.success?
      end

      def test_invalid_title
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user

        category_group = FactoryBot.create(:category_group, title: @title, user_id: user.id)
        @params[:category_group_id] = category_group.id

        @params[:title] = nil

        result = ::Organizers::AddCategory.call(@params)

        refute result.success?
      end

      private

      def before_all
        @password = Faker::Internet.password(min_length: 8, max_length: 15)
        @email = Faker::Internet.email
        @title = Faker::Name.first_name
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
