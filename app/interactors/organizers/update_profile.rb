# frozen_string_literal: true

module Organizers
  class UpdateProfile
    include Interactor::Organizer

    organize ::UpdateProfile
  end
end
