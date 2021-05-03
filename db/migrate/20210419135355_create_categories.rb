class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.timestamps
    end

    t.references :parent, foreign_key: { to_table: :categories }
  end
end
