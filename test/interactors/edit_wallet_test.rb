# frozen_string_literal: true

require 'test_helper'

module Test
  module Interactors
    class EditWalletTest < MiniTest::Test
      def test_valid_save
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user
        @params[:wallet] = user.wallets.first

        result = EditWallet.call(@params)

        assert result.success?
      end

      def test_invalid_title
        before_all
        user = FactoryBot.create(:user, email: @email, password: @password, password_confirmation: @password)
        @params[:current_user] = user
        @params[:title] = nil
        @params[:wallet] = user.wallets.first

        result = EditWallet.call(@params)

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
          currency: 1
        }
      end
    end
  end
end
