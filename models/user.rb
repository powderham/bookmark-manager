require_relative 'data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource

 property :id, Serial
 property :email, String

 property :password_secret, Text

  def password=(password)
    self.password_secret = BCrypt::Password.create(password)
  end

  # def password
  #   return BCrypt::Password.new(password) if self.password
  #   nil
  # end

#  has n, :links, :through => Resource

end
