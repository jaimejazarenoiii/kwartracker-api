class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :title, null: false
      t.integer :category, null: false
      t.integer :currency, null: false
      t.float :target_total, null: true
      t.datetime :target_date, null: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
