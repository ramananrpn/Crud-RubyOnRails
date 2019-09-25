class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts  do |t|
      t.string :account_number
      t.string :name
      t.string :account_type
      t.string :password
      t.integer :balance
      t.timestamps
    end
    # add_index : , :account_number ,:unique => true
  end
end
