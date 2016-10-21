require_relative 'data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation

 property :id, Serial
 property :email, String
 property :password_secret, Text

 validates_confirmation_of :password_secret, :confirm => :password_confirmation

  def password=(password)
    self.password_secret = BCrypt::Password.create(password)
  end

  # def password
  #   return BCrypt::Password.new(password) if self.password
  #   nil
  # end

#  has n, :links, :through => Resource

end
