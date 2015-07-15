class Post < ActiveRecord::Base
  belongs_to :author, foreign_key: :user_id, class_name: User

  has_many :categories_posts
  has_many :categories, through: :categories_posts

  validates :title, :content, presence: true
end
