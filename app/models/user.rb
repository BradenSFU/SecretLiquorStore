class User < ApplicationRecord
  attr_accessor :Password
  before_save :CreateHashedPassword

  EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :Username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :Email, :presence => true, :uniqueness => true, :format => EMAIL
  validates :Password, :confirmation => true #password_confirmation attr
  validates_length_of :Password, :in => 6..20, :on => :create

=begin
  validates_confirmation_of :Password
  validates_presence_of :Password, :on => :create
  validates_presence_of :Username
  validates_uniqueness_of :Username
  validates_presence_of :Email
  validates_uniqueness_of :Email
=end

  def CreateHashedPassword
    return unless :Password.present?
    self.saltedpassword = BCrypt::Engine.generate_salt
    self.hashedpassword = BCrypt::Engine.hash_secret(:Password, saltedpassword)
  end
  
  def self.authenticate(email, password)
    user = find_by Email: email
    if user && user.hashedpassword == BCrypt::Engine.hash_secret(:Password, user.saltedpassword)  #password, user.saltedpassword)
      user
    else
      nil
    end
  end
end
