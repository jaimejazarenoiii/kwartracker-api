# frozen_string_literal: true

module Organizers
  class EditWallet
    include Interactor::Organizer

    organize ::FindWallet, ::EditWallet
  end
end
