class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.timestamps
    end

    add_reference :categories, :parent, index: true, null:true
    add_reference :categories, :image, null: false, foreign_key: true
  end
end
