class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :title, null: false
      t.string :type, null: false
      t.integer :currency, null: false
      t.float :total, null: true
      t.datetime :target_date, null: true

      t.timestamps
    end
  end
end
