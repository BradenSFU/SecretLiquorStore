class User < ApplicationRecord
  attr_accessor :Password
  before_save :CreateHashedPassword

  EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :Username, :presence => true, :uniqueness => true, :length => 3..20
  validates :Email, :presence => true, :uniqueness => true, :format => EMAIL
  validates :Password, :presence => true, :confirmation => true, :length => 6..20

  def CreateHashedPassword
    return unless :password.present?
    self.saltedpassword = BCrypt::Engine.generate_salt
    self.hashedpassword = BCrypt::Engine.hash_secret(:Password, saltedpassword)
  end

  def self.authenticate(email_or_username, password)
    user = EMAIL.match(email_or_username) ? (find_by Email: email_or_username) : (find_by Username: email_or_username)
    if user && user.hashedpassword == BCrypt::Engine.hash_secret(password, user.saltedpassword)
      user
    else
      nil
    end
  end

end
