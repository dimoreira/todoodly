class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  
  has_secure_password
  validates_presence_of :password, :on => :create
  
  has_many :lists
end
