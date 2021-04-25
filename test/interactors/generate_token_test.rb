# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class GenerateTokenTest < MiniTest::Test
      def test_success_result
        before_all
        result = GenerateToken.call(@params)

        assert result.success?
        refute_nil result.token
      end

      def test_failed_result
        before_all
        @params[:user] = nil

        result = GenerateToken.call(@params)

        refute result.success?
        assert_nil result.token
      end

      private

      def before_all
        @user = FactoryBot.build(:user)
        @params = { user: @user, user_id: @user.id }
      end
    end
  end
end
