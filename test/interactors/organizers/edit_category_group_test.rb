# frozen_string_literal: true

require 'test_helper'

module Test
  module Organizers
    module Interactors
      class EditCategoryGroupTest < MiniTest::Test
        def test_valid_save
          before_all
          user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
          @params[:current_user] = user
          @params[:id] = user.category_groups.first.id
          result = ::Organizers::EditCategoryGroup.call(@params)

          assert result.success?
        end

        def test_invalid_title
          before_all
          user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
          @params[:current_user] = user
          @params[:title] = nil
          @params[:id] = user.category_groups.first.id

          result = ::Organizers::EditCategoryGroup.call(@params)

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
end
