# frozen_string_literal: true

class EditWallet
  include Interactor::Organizer

  organize FindWallet, EditWallet
end
