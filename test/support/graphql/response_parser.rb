# frozen_string_literal: true

# test/support/graphql/response_parser.rb

module GraphQL
  module ResponseParser
    def parse_graphql_response(original_response)
      JSON.parse(original_response).delete('data')
    end

    def parse_graphql_errors(original_response)
      JSON.parse(original_response).delete('errors')
    end
  end
end
