# frozen_string_literal: true

# test/graphql/mutations/sign_up_with_email_mutation_test.rb

require 'test_helper'

module Mutations
  class SignUpWithEmailMutationTest < ActionDispatch::IntegrationTest
    test 'register user with valid params' do
      expected_first_name = 'Kwartracker'
      post('/graphql',
           params: {
             query: sign_up_with_email_mutation,
             variables: sign_up_with_email_mutation_variables({ first_name: expected_first_name })
           })

      @json_response = parse_graphql_response(response.body)

      assert_equal expected_first_name, @json_response.dig('signUpWithEmail', 'user', 'firstName')
      assert_not_nil @json_response.dig('signUpWithEmail', 'token')
    end

    test 'register user with invalid email' do
      expected_err_mssg = 'Email is invalid'
      post('/graphql',
           params: {
             query: sign_up_with_email_mutation,
             variables: sign_up_with_email_mutation_variables({ email: 'ZXC' })
           })

      @json_response = parse_graphql_errors(response.body)

      assert_equal expected_err_mssg, @json_response[0]['message']
    end

    test 'register user with invalid password' do
      expected_err_mssg = 'Password is too short (minimum is 8 characters) ' \
                          'and Password confirmation is too short (minimum is 8 characters)'
      post('/graphql',
           params: {
             query: sign_up_with_email_mutation,
             variables: sign_up_with_email_mutation_variables({ password: '1', password_confirmation: '1' })
           })

      @json_response = parse_graphql_errors(response.body)

      assert_equal expected_err_mssg, @json_response[0]['message']
    end

    test 'register user with invalid password confirmation' do
      expected_err_mssg = "Password confirmation doesn't match Password"
      post('/graphql',
           params: {
             query: sign_up_with_email_mutation,
             variables: sign_up_with_email_mutation_variables({ password_confirmation: 'Password123!' })
           })

      @json_response = parse_graphql_errors(response.body)

      assert_equal expected_err_mssg, @json_response[0]['message']
    end

    test 'register user with invalid age' do
      age_input = 1
      expected_err_mssg = "Age #{age_input} is not a valid age"
      post('/graphql',
           params: {
             query: sign_up_with_email_mutation,
             variables: sign_up_with_email_mutation_variables({ age: age_input })
           })

      @json_response = parse_graphql_errors(response.body)

      assert_equal expected_err_mssg, @json_response[0]['message']
    end
  end
end
