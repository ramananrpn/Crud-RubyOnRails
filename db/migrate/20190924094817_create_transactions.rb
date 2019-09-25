class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :account_number
      t.string :transaction_type
      t.integer :amount
      t.integer :balance

      t.timestamps
    end

  end
end
