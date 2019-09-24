class Account < ActiveRecord::Base
  attr_accessible :account_number, :account_type, :balance, :name, :password
end
