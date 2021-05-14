# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class AddWalletTest < MiniTest::Test
      def test_valid_save
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user

        result = AddWallet.call(@params)

        assert result.success?
      end

      def test_invalid_title
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user
        @params[:title] = nil

        result = AddWallet.call(@params)

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
          title: Faker::Name.first_name,
          amount: 1000,
          currency: 1
        }
      end
    end
  end
end
