# frozen_string_literal: true

# test/support/graphql/mutation_variables.rb

module GraphQL
  module MutationVariables
    def sign_up_with_email_mutation_variables(attrs = {})
      user_attrs = attributes_for(:user)

      attrs.reverse_merge!(user_attrs)

      # Camelize for GraphQL compatibility and return
      camelize_hash_keys(attrs).to_json
    end

    def sign_in_with_email_mutation_variables(attrs = {})
      user_attrs = {
        email: 'kwartracker@kwartracker.com',
        password: 'Password123!'
      }

      attrs.reverse_merge!(user_attrs)

      # Camelize for GraphQL compatibility and return
      camelize_hash_keys(attrs).to_json
    end

    def add_wallet_mutation_variables(attrs = {})
      wallet_attrs = attributes_for(:wallet)
      wallet_attrs[:amount] = 123

      attrs.reverse_merge!(wallet_attrs)

      # Camelize for GraphQL compatibility and return
      camelize_hash_keys(attrs).to_json
    end

    def add_category_group_mutation_variables(attrs = {})
      category_group_attrs = attributes_for(:category_group)
      category_group_attrs[:title] = 'category group'

      attrs.reverse_merge!(category_group_attrs)

      # Camelize for GraphQL compatibility and return
      camelize_hash_keys(attrs).to_json
    end

    def add_category_mutation_variables(attrs = {})
      category_attrs = attributes_for(:category)
      category_attrs[:title] = 'category'
      category_attrs[:category_group_id] = @category_group.id

      attrs.reverse_merge!(category_attrs)

      # Camelize for GraphQL compatibility and return
      camelize_hash_keys(attrs).to_json
    end

    private

    def camelize_hash_keys(hash)
      raise unless hash.is_a?(Hash)

      hash.transform_keys { |key| key.to_s.camelize(:lower) }
    end
  end
end
