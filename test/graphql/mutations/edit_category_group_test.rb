# frozen_string_literal: true

require 'test_helper'

module Mutations
  class EditCategoryGroupMutationTest < ActionDispatch::IntegrationTest
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

      @category_group = user.category_groups.first
      assert_equal @category_group.title, 'To be budgeted'

      json_response = parse_graphql_response(response.body)
      @token = json_response.dig('signInWithEmail', 'token')
    end

    test 'valid edit category group' do
      post('/graphql',
           params: {
             query: edit_category_group_mutation,
             variables: add_category_group_mutation_variables({ id: @category_group.id, title: 'edit category group' })
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })
      json_response = parse_graphql_response(response.body)
      assert_equal json_response['editCategoryGroup']['title'], 'edit category group'
    end
  end
end
