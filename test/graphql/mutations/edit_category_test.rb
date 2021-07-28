# frozen_string_literal: true

require 'test_helper'

module Mutations
  class EditCategoryMutationTest < ActionDispatch::IntegrationTest
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

      @category = user.categories.first
      assert_equal @category.title, 'To be budgeted'

      json_response = parse_graphql_response(response.body)
      @token = json_response.dig('signInWithEmail', 'token')
    end

    test 'valid edit category group' do
      post('/graphql',
           params: {
             query: edit_category_mutation,
             variables: add_category_mutation_variables({ id: @category.id,
                                                          title: 'edit category',
                                                          categoryGroupId: @category.category_group_id })
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })
      json_response = parse_graphql_response(response.body)
      assert_equal json_response['editCategory']['title'], 'edit category'
    end
  end
end
