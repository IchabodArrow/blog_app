class User < ActiveRecord::Base
  has_many :posts

  def self.authenticate(email, password)
    User.where(email: email).first
  end
end
