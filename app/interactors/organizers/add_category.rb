# frozen_string_literal: true

module Organizers
  class AddCategory
    include Interactor::Organizer

    organize ::AddCategory
  end
end
