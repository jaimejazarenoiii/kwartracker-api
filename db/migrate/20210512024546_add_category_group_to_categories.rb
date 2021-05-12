class AddCategoryGroupToCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :category_group, foreign_key: true
  end
end
