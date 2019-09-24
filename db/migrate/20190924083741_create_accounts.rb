class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts , :primary_key => :account_number do |t|
      t.string :account_number
      t.string :name
      t.string :account_type
      t.string :password
      t.integer :balance

      t.timestamps
    end
  end
end
