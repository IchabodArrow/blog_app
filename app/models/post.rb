class Post < ActiveRecord::Base
  belongs_to :user

  has_many :categories_posts
  has_many :categories, through: :categories_posts

  validates :title, :content, presence: true
end
