class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :title
      t.string :type
      t.integer :currency
      t.float :total
      t.datetime :target_date

      t.timestamps
    end
  end
end
