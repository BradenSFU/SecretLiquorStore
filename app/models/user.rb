class User < ApplicationRecord
  has_many :publishes
  has_many :likes, dependent: :destroy

  attr_accessor :Password

  before_save :CreateHashedPassword
  before_update :check_password

  EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :Username, :presence => true, :uniqueness => true, :length => 3..20
  validates :Email, :presence => true, :uniqueness => true, :format => EMAIL
  validates :Password, :presence => true, :confirmation => true, :length => 6..20, on: :create

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
  
private
  def check_password
    is_ok = self.Password.nil? || self.Password.empty? || self.Password.length >= 6

      self.errors[:Password] << "Password is too short (minimum is 6 characters)" unless is_ok
      is_ok
    end
end
