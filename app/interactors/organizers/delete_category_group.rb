# frozen_string_literal: true

module Organizers
  class DeleteCategoryGroup
    include Interactor::Organizer

    organize ::FindCategoryGroup, ::DeleteCategoryGroup
  end
end
