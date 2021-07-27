# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class DeleteCategoryGroupTest < MiniTest::Test
      def test_valid_save
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user

        result = AddCategoryGroup.call(@params)
        @params[:category_group] = result.category_group

        result = DeleteCategoryGroup.call(@params)

        assert result.success?
      end

      private

      def before_all
        @password = Faker::Internet.password(min_length: 8, max_length: 15)
        @email = Faker::Internet.email
        set_params
      end

      def set_params
        @params = {
          title: 'category group one'
        }
      end
    end
  end
end
