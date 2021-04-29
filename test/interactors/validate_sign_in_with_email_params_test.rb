# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class ValidateSignInWithEmailParamsTest < MiniTest::Test
      def test_success_result
        before_all
        FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        result = ValidateSignInWithEmailParams.call(@params)
        assert result.success?
        refute_nil result.user
      end

      def test_record_not_found
        before_all
        expected_err_mssg = 'Record not found'
        @params[:credentials][:email] = 'asd'

        result = ValidateSignInWithEmailParams.call(@params)

        refute result.success?
        assert result.error, expected_err_mssg
      end

      def test_invalid_credentials
        before_all
        expected_err_mssg = 'Invalid credentials.'
        @params[:credentials][:password] = '1'

        result = ValidateSignInWithEmailParams.call(@params)

        refute result.success?
        assert result.error, expected_err_mssg
      end

      private

      def before_all
        @password = Faker::Internet.password(min_length: 8, max_length: 15)
        @email = Faker::Internet.email
        set_params
      end

      def set_params
        @params = {
          credentials: {
            email: @email,
            password: @password
          }
        }
      end
    end
  end
end
