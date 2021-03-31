class CreateImageables < ActiveRecord::Migration[6.1]
  def change
    create_table :imageables do |t|
      t.string :image
      t.integer :type

      t.timestamps
    end
  end
end
