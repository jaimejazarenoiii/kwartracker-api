# frozen_string_literal: true

# app/interactors/update_profile.rb
class UpdateProfile
  include Interactor

  def call
    user = context.current_user

    context.fail!(error: user.errors.full_messages.to_sentence) unless user.update(profile)
    context.user = user
  end

  private

  def profile
    {
      first_name: context.first_name,
      middle_name: context.middle_name,
      last_name: context.last_name,
      gender: context.gender,
      age: context.age
    }
  end
end
