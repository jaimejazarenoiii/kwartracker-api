class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.timestamps
    end

    add_reference :categories, :parent, index: true, null:true
  end
end
