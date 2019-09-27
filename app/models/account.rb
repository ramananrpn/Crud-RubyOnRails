class Account < ActiveRecord::Base

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role||=0
  end
  attr_accessible :account_number, :account_type, :balance, :name, :password , :password_confirmation
  validates :name , :presence => true
  validates :account_type , :presence => true
  validates :password, :confirmation => true , presence: true #password_confirmation attr
  validates :account_number, :uniqueness => true
end
