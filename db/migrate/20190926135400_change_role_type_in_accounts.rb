class ChangeRoleTypeInAccounts < ActiveRecord::Migration
  def up
    change_column :accounts , :role ,:integer
  end

  def down
    change_column :accounts , :role , :string
  end
end
