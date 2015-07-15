class User < ActiveRecord::Base
  has_many :posts

  attr_accessor :password, :password_confirmation

  validates :name, :email, presence: true
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user.encrypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def register
    if valid?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end

    save
  end
end
