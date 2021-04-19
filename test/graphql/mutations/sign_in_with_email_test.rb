# frozen_string_literal: true

# test/graphql/mutations/sign_in_with_email_mutation_test.rb

require 'test_helper'

module Mutations
  class SignInWithEmailMutationTest < ActionDispatch::IntegrationTest
    test 'login user with valid params' do
      password = 'Password123!'
      expected_email = 'info@kwartracker.com'
      user = create(:user,
                    email: expected_email,
                    password: password,
                    password_confirmation: password)
      post('/graphql',
           params: {
             query: sign_in_with_email_mutation,
             variables: sign_in_with_email_mutation_variables({ email: user.email,
                                                                password: password })
           })

      @json_response = parse_graphql_response(response.body)

      assert_equal expected_email, @json_response.dig('signInWithEmail', 'user', 'email')
      assert_not_nil @json_response.dig('signInWithEmail', 'token')
    end

    test 'login user with invalid email' do
      expected_err_mssg = 'Record not found'
      post('/graphql',
           params: {
             query: sign_in_with_email_mutation,
             variables: sign_in_with_email_mutation_variables({ email: 'ZXC' })
           })

      @json_response = parse_graphql_errors(response.body)

      assert_equal expected_err_mssg, @json_response[0]['message']
    end

    test 'login user with invalid password' do
      password = 'Password123!'
      email = 'info@kwartracker.com'
      user = create(:user,
                    email: email,
                    password: password,
                    password_confirmation: password)
      expected_err_mssg = 'Invalid credentials.'
      post('/graphql',
           params: {
             query: sign_in_with_email_mutation,
             variables: sign_in_with_email_mutation_variables({ email: user.email,
                                                                password: '1' })
           })

      @json_response = parse_graphql_errors(response.body)

      assert_equal expected_err_mssg, @json_response[0]['message']
    end
  end
end
