# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class UpdateProfileTest < MiniTest::Test
      def test_success_result
        before_all

        result = UpdateProfile.call(@params)

        assert result.success?
      end

      def test_invalid_age
        before_all
        age_input = 1
        expected_err_mssg = "Age #{age_input} is not a valid age"

        @params[:age] = age_input

        result = UpdateProfile.call(@params)

        refute result.success?
        assert result.error, expected_err_mssg
      end

      private

      def before_all
        password = Faker::Internet.password(min_length: 8, max_length: 15)
        email = Faker::Internet.email
        set_params
        user = FactoryBot.create(:user,
                                 email: email,
                                 password: password,
                                 password_confirmation: password)
        @params[:current_user] = user
      end

      def set_params
        @params = {
          first_name: 'Kwartracker',
          middle_name: '',
          last_name: 'Kwartracker',
          gender: 0,
          age: 24
        }
      end
    end
  end
end
