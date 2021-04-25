# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class ValidateSignUpWithEmailParamsTest < MiniTest::Test
      def test_success_result
        before_all
        result = ValidateSignUpWithEmailParams.call(@params)
        assert result.success?
        refute_nil result.user
      end

      def test_invalid_email
        before_all
        expected_err_mssg = 'Email is invalid'
        @params[:email] = 'asd'

        result = ValidateSignUpWithEmailParams.call(@params)

        refute result.success?
        assert result.error, expected_err_mssg
      end

      def test_invalid_password
        before_all
        expected_err_mssg = 'Password is too short (minimum is 8 characters) ' \
          'and Password confirmation is too short (minimum is 8 characters)'
        @params[:password] = '1'
        @params[:password_confirmation] = '1'

        result = ValidateSignUpWithEmailParams.call(@params)

        refute result.success?
        assert result.error, expected_err_mssg
      end

      def test_invalid_password_confirmation
        before_all
        expected_err_mssg = "Password confirmation doesn't match Password"

        @params[:password_confirmation] = 'Asd123123!'

        result = ValidateSignUpWithEmailParams.call(@params)

        refute result.success?
        assert result.error, expected_err_mssg
      end

      def test_invalid_age
        before_all
        age_input = 1
        expected_err_mssg = "Age #{age_input} is not a valid age"

        @params[:profile][:age] = age_input

        result = ValidateSignUpWithEmailParams.call(@params)

        refute result.success?
        assert result.error, expected_err_mssg
      end

      private

      def before_all
        @password = Faker::Internet.password(min_length: 8, max_length: 15)
        set_params
      end

      def set_params
        @params = { email: Faker::Internet.email,
                    password: @password,
                    password_confirmation: @password,
                    profile: {
                      first_name: 'Kwartracker',
                      middle_name: '',
                      last_name: 'Kwartracker',
                      gender: 0,
                      age: 24
                    } }
      end
    end
  end
end
