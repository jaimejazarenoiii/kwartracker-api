# AuthenticableApiUser
# frozen_string_literal: true

module AuthenticableApiUser
  extend ActiveSupport::Concern

  private

  def ready?(*)
    return true if valid_token?
    return true if context[:current_user]

    raise unauthorized_error
  end

  def valid_token?
    JWT.decode(context[:token], ENV.fetch('HMAC_SECRET'), true, { algorithm: ENV.fetch('HMAC_ALGORITHM') })
  rescue JWT::DecodeError => e
    raise unauthorized_error(message: e.message)
  end

  def unauthorized_error(message: '')
    execution_error(message: message, status: :unauthorized, code: 401)
  end
end
