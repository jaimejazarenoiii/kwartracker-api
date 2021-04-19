# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :title, null: false
      t.float :amount, null: false
      t.datetime :datetime, null: false
      t.boolean :recurring, null: true
      t.integer :frequency, null: true
      t.string :frequence_date, null: true
      t.string :with, null: true

      t.timestamps
    end
  end
end
