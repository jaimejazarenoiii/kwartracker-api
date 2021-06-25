# frozen_string_literal: true

module Organizers
  class DeleteCategory
    include Interactor::Organizer

    organize ::FindCategory, ::DeleteCategory
  end
end
