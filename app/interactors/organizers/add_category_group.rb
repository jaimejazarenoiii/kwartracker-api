# frozen_string_literal: true

module Organizers
  class AddCategoryGroup
    include Interactor::Organizer

    organize ::AddCategoryGroup
  end
end
