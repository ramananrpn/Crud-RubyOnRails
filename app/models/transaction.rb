class Transaction < ActiveRecord::Base
  attr_accessible :account_number, :amount, :balance, :transaction_type
end
