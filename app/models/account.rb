class Account < ActiveRecord::Base
  attr_accessible :account_number, :account_type, :balance, :name, :password , :password_confirmation
  validates :name , :presence => true
  validates :account_type , :presence => true
  validates :password, :confirmation => true , presence: true#password_confirmation attr
  validates :account_number, :uniqueness => true
end
