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

    def update_profile_mutation_variables(attrs = {})
      user_attrs = attributes_for(:user).except(:email,
                                                :password,
                                                :password_confirmation)

      attrs.reverse_merge!(user_attrs)

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
