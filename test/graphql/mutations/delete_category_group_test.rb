# frozen_string_literal: true

require 'test_helper'

module Mutations
  class DeleteCategoryGroupMutationTest < ActionDispatch::IntegrationTest
    setup do
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
      @category_group_count = user.category_groups.count
      @category_group = build(:category_group)
      @category_group.user_id = user.id
      @category_group.save

      json_response = parse_graphql_response(response.body)
      @token = json_response.dig('signInWithEmail', 'token')
    end

    test 'valid delete category group' do
      post('/graphql',
           params: {
             query: delete_category_group_mutation,
             variables: { id: @category_group.id }
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })
      json_response = parse_graphql_response(response.body)
      assert_equal json_response['deleteCategoryGroup'].count, @category_group_count
    end

    test 'invalid category group id' do
      post('/graphql',
           params: {
             query: delete_category_group_mutation,
             variables: { id: 100 }
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })
      json_response = parse_graphql_errors(response.body)
      expected_err_mssg = 'Record not found.'
      assert_equal expected_err_mssg, json_response[0]['message']
    end
  end
end
