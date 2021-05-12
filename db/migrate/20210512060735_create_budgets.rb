class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.float :amount, null: false, default: 0
      t.belongs_to :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
