# The User model
class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :email
end
