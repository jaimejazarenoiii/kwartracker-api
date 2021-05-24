# frozen_string_literal: true

# test/graphql/queries/transactions_query_test.rb

require 'test_helper'

module Queries
  class TransactionsQueryTest < ActionDispatch::IntegrationTest
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

      @json_response = parse_graphql_response(response.body)
      @token = @json_response.dig('signInWithEmail', 'token')
    end

    test 'fetch transactions' do
      post('/graphql',
           params: {
             query: transactions_query
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })
      @json_response = parse_graphql_response(response.body)
      assert_equal @json_response['transactions'].count, 1
    end
  end
end
