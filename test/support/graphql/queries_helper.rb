# frozen_string_literal: true

# test/support/graphql/queries_helper.rb
# rubocop:disable Metrics/MethodLength
module GraphQL
  module QueriesHelper
    def user_profile_query(_input: {})
      %(
        query {
          profile {
            id
            email
            firstName
            middleName
            lastName
            gender
            age
          }
        }
      )
    end

    def wallets_query(_input = {})
      %(
        query {
          wallets {
            token
            user {
              id
              title
              category
              currency
              targetTotal
              targetDate
            }
          }
        }
      )
    end
  end
end
# rubocop:enable Metrics/MethodLength
