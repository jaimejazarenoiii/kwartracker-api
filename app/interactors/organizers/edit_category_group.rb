# frozen_string_literal: true

module Organizers
  class EditCategoryGroup
    include Interactor::Organizer

    organize ::FindCategoryGroup, ::EditCategoryGroup
  end
end
