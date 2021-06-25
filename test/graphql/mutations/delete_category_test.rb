# frozen_string_literal: true

require 'test_helper'

module Mutations
  class DeleteCategoryMutationTest < ActionDispatch::IntegrationTest
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
      @category = @user.categories.first
      @json_response = parse_graphql_response(response.body)
      @token = @json_response.dig('signInWithEmail', 'token')
    end

    test 'valid delete category' do
      post('/graphql',
           params: {
             query: delete_category_mutation,
             variables: { id: @category.id }
           }, headers: {
             'Authorization': "Bearer #{@token}"
           })

      @json_response = parse_graphql_response(response.body)
      assert_equal @json_response['deleteCategory'].count, 1
    end
  end
end
