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
            title
            currency
            transactions {
              title
              amount
              datetime
              category {
                id
                title
                budgets {
                  id
                  amount
                  updatedAt
                  createdAt
                }
              }
            }
          }
        }
      )
    end

    def category_groups_query(_input = {})
      %(
      query {
        categoryGroups {
          id
          title
          categories {
            id
            title
            transactions {
              title
              amount
              datetime
            }
            budgets {
              id
              amount
              updatedAt
              createdAt
            }
          }
        }
      }
      )
    end

    def categories_query(_input = {})
      %(
        query {
          categories {
            id
            title
            budgets {
              amount
              id
              createdAt
              updatedAt
            },
            transactions {
              amount
              datetime
              id
              title
              wallet {
                currency
                id
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
