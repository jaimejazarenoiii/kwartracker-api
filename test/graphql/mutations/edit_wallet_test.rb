# frozen_string_literal: true

require 'test_helper'

module Mutations
  class EditWalletMutationTest < ActionDispatch::IntegrationTest
    setup do
      password = 'Password123!'
      expected_email = 'info@kwartracker.com'
      @user = create(:user,
                     email: expected_email,
                     password: password,
                     password_confirmation: password)
      post('/graphql',
           params: {
             query: sign_in_with_email_mutation,
             variables: sign_in_with_email_mutation_variables({ email: @user.email,
                                                                password: password })
           })
      @wallet = @user.wallets.first

      @json_response = parse_graphql_response(response.body)
      @token = @json_response.dig('signInWithEmail', 'token')
    end

    test 'valid edit wallet' do
      post('/graphql',
           params: {
             query: edit_wallet_mutation,
             variables: add_wallet_mutation_variables(id: @wallet.id, title: 'test')
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })
      @json_response = parse_graphql_response(response.body)
      assert_equal @json_response.dig('editWallet', 'transactions').count, 1
      assert_equal @json_response.dig('editWallet', 'title'), 'test'
    end
  end
end
