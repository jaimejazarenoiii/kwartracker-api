class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :type, null:false
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
