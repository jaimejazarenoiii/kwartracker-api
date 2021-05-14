class RemoveParentFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_reference :categories, :parent, foreign_key: { to_table: :categories }
  end
end
