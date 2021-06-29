# frozen_string_literal: true

# test/graphql/mutations/update_profile_test.rb

require 'test_helper'

module Mutations
  class UpdateProfileMutationTest < ActionDispatch::IntegrationTest
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

    test 'success update user' do
      expected_first_name = 'Test'
      post('/graphql',
           params: {
             query: update_profile_mutation,
             variables: update_profile_mutation_variables({ first_name: expected_first_name })
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })

      @json_response = parse_graphql_response(response.body)
      assert_equal @json_response.dig('updateProfile', 'firstName'), expected_first_name
    end

    test 'update user profile with invalid age' do
      age_input = 1
      expected_err_mssg = "Age #{age_input} is not a valid age"
      post('/graphql',
           params: {
             query: update_profile_mutation,
             variables: update_profile_mutation_variables({ age: age_input })
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })

      @json_response = parse_graphql_errors(response.body)

      assert_equal expected_err_mssg, @json_response[0]['message']
    end
  end
end
