# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :edit_wallet, mutation: Mutations::EditWallet
    field :add_wallet, mutation: Mutations::AddWallet
    field :sign_in_with_email, mutation: Mutations::SignInWithEmail
    field :sign_up_with_email, mutation: Mutations::SignUpWithEmail
  end
end
