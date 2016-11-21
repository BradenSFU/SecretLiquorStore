class User < ApplicationRecord
  has_many :likes
  has_many :publishes

  attr_accessor :Password
  before_save :CreateHashedPassword

  EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :Username, :presence => true, :uniqueness => true, :length => 3..20
  validates :Email, :presence => true, :uniqueness => true, :format => EMAIL
  validates :Password, :presence => true, :confirmation => true, :length => 6..20

  def CreateHashedPassword
    return unless self.Password.present?
    self.passwordsalt = BCrypt::Engine.generate_salt
    self.hashedpassword = BCrypt::Engine.hash_secret(self.Password, passwordsalt)
  end

  def self.authenticate(email_or_username, password)
    user = EMAIL.match(email_or_username) ? (find_by Email: email_or_username) : (find_by Username: email_or_username)
    if user && user.hashedpassword == BCrypt::Engine.hash_secret(password, user.passwordsalt)
      user
    else
      nil
    end
  end

  def is_liked()
    if Like.where(:publish, :user_id => self.id).present?
      Like.where(:publish, :user_id => self.id).last.islike==true
    end
  end

  def is_disliked()
    if Like.where(:publish, :user_id => self.id).present?
      Like.where(:publish, :user_id => self.id).last.islike==false
    end
  end

end
