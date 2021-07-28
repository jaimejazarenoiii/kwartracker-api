# frozen_string_literal: true

module Organizers
  class EditCategory
    include Interactor::Organizer

    organize ::FindCategory, ::EditCategory
  end
end
