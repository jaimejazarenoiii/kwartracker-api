class CreateImageables < ActiveRecord::Migration[6.1]
  def change
    create_table :imageables do |t|
      t.string :picture
      t.integer :type
      t.references :imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
