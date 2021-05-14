# frozen_string_literal: true

# test/support/graphql/mutations_helper.rb
# rubocop:disable Metrics/MethodLength
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
  end
end
# rubocop:enable Metrics/MethodLength
