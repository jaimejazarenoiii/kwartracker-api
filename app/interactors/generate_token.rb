# frozen_string_literal: true

# GenerateToken
# user authentication
class GenerateToken
  include Interactor

  delegate :user, to: :context
  delegate :id, to: :user, prefix: true

  def call
    context.token = generate_token
  end

  private

  def generate_token
    JWT.encode(payload, hmac_secret, hmac_algorithm)
  rescue StandardError => e
    context.fail!(error: e.message)
  end

  def payload
    {
      sub: user_id,
      iat: issued_at,
      exp: expiration_time
    }
  end

  def hmac_secret
    ENV.fetch('HMAC_SECRET')
  end

  def hmac_algorithm
    ENV.fetch('HMAC_ALGORITHM')
  end

  def expiration_time
    Time.now.to_i + 3 * 30 * 24 * 3600
  end

  def issued_at
    Time.now.to_i
  end
end
