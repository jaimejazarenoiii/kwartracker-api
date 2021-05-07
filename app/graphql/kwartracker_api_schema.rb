# frozen_string_literal: true

class KwartrackerApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.unauthorized_object(error)
    # Add a top-level error to the response instead of returning nil:
    raise GraphQL::ExecutionError,
          "An object of type #{error.type.graphql_name} was hidden due to permissions"
  end

  def self.unauthorized_field(error)
    # Add a top-level error to the response instead of returning nil:
    err_field_name = error.field.graphql_name
    err_type_name = error.type.graphql_name
    raise GraphQL::ExecutionError,
          "The field #{err_field_name} on an object of type #{err_type_name} was hidden due to permissions"
  end
end
