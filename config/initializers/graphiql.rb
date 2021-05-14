if Rails.env.development? || Rails.env.staging?
  GraphiQL::Rails.config.headers['Authorization'] = -> (context) { "bearer #{context.cookies['_graphql_token']}" }
end
