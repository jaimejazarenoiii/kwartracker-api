# frozen_string_literal: true

module Organizers
  class DeleteWallet
    include Interactor::Organizer

    organize ::FindWallet, ::DeleteWallet
  end
end
