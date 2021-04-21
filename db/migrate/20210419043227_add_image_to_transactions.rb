class AddImageToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :image, null: true, foreign_key: true
  end
end
