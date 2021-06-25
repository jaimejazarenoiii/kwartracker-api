# frozen_string_literal: true

# test/support/graphql/mutations_helper.rb
# rubocop:disable Metrics/MethodLength, Metrics/ModuleLength
module GraphQL
  module MutationsHelper
    def sign_up_with_email_mutation(_input = {})
      %(
        mutation SignUpWithEmail(
          $email: String!,
          $password: String!,
          $passwordConfirmation: String!,
          $firstName: String!,
          $middleName: String
          $lastName: String!,
          $gender: Int!,
          $age: Int!
        ) {
          signUpWithEmail(input: {
            email: $email,
            password: $password,
            passwordConfirmation: $passwordConfirmation,
            profile: {
              firstName: $firstName,
              middleName: $middleName,
              lastName: $lastName,
              gender: $gender,
              age: $age
            }
          }) {
            token
            user {
              id
              email
              firstName
              middleName
              lastName
              gender
              age
            }
          }
        }
      )
    end

    def sign_in_with_email_mutation(_input = {})
      %(
        mutation SignInWithEmail(
          $email: String!,
          $password: String!
        ) {
          signInWithEmail(input: {
            credentials: {
              email: $email,
              password: $password
            }
          }) {
            token
            user {
              id
              email
              firstName
              middleName
              lastName
              gender
              age
            }
          }
        }
      )
    end

    def add_wallet_mutation(_input = {})
      %(
        mutation AddWallet(
          $title: String!,
          $amount: Float!,
          $currency: Int!
        ) {
          addWallet(input: {
            title: $title,
            amount: $amount,
            currency: $currency
          }) {
            title
            currency
            transactions {
              id
              title
              amount
              category {
                title
              }
            }
          }
        }
      )
    end

    def edit_wallet_mutation(_input = {})
      %(
        mutation EditWallet(
          $id: ID!,
          $title: String!,
          $currency: Int!
        ) {
          editWallet(input: {
            id: $id,
            title: $title,
            currency: $currency
          }) {
            title
            currency
            transactions {
              id
              title
              amount
              category {
                title
              }
            }
          }
        }
      )
    end

    def delete_wallet_mutation(_input = {})
      %(
        mutation DeleteWallet(
          $id: ID!,
        ) {
          deleteWallet(input: {
            id: $id,
          }) {
            title
            currency
            transactions {
              id
              title
              amount
              category {
                title
              }
            }
          }
        }
      )
    end

    def delete_category_mutation(_input = {})
      %(
        mutation DeleteCategory(
          $id: ID!,
        ) {
          deleteCategory(input: {
            id: $id,
          }) {
            id
            title
            budgets {
              id
              amount
            }
            transactions {
              id
              title
              amount
            }
          }
        }
      )
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/ModuleLength
