class User < ActiveRecord::Base
  
  has_many :posts

  attr_accessor :password, :password_confirmation

  validates :name, :email, presence: true
  validates :password, confirmation: true
  validates_with Validators::NameValidator
  # validate :full_name 
  #User.includes(:posts)
  

  # def full_name
  #   errors.add(:name, "Enter firstname and surname") unless name.split(' ').size =="2"
  # end 
  
  def self.authenticate(email, password)
    user = User.where(email: email).first
    if user.encrypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def self.search_posts(name)
    #binding.pry
    user = User.where('name LIKE ?', "%#{name}").first
    User.where('name LIKE ?', "%#{name}").first
   
    
    user.posts
  end

  def register
    if valid?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end

    save
  end
end


