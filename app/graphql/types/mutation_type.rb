# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_category, mutation: Mutations::DeleteCategory
    field :edit_wallet, mutation: Mutations::EditWallet
    field :delete_wallet, mutation: Mutations::DeleteWallet
    field :add_wallet, mutation: Mutations::AddWallet
    field :sign_in_with_email, mutation: Mutations::SignInWithEmail
    field :sign_up_with_email, mutation: Mutations::SignUpWithEmail
    field :update_profile, mutation: Mutations::UpdateProfile
    field :addCategoryGroup, mutation: Mutations::AddCategoryGroup
    field :addCategory, mutation: Mutations::AddCategory
    field :editCategoryGroup, mutation: Mutations::EditCategoryGroup
    field :deleteCategoryGroup, mutation: Mutations::DeleteCategoryGroup
    field :editCategory, mutation: Mutations::EditCategory
  end
end
