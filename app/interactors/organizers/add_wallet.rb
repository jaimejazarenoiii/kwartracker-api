# frozen_string_literal: true

module Organizers
  class AddWallet
    include Interactor::Organizer

    organize ::AddWallet
  end
end
