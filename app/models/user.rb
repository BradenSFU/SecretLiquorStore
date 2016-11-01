class User < ApplicationRecord
  attr_accessor :Password
  before_save :CreateHashedPassword

  def CreateHashedPassword
    self.salt = BCrypt::Engine.generate_salt
    self.hashedpassword = BCrypt::Engine.hash_secret(:Password, salt)
  end

  def self.authenticate(email, password)
    user = find_by Email: email
    if user && user.hashedpassword == BCrypt::Engine.hash_secret(:Password, user.salt)
      user
    else
      nil
    end
  end
end
