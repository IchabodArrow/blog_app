class Comment < ActiveRecord::Base
  belongs_to :commenter, foreign_key: :user_id, class_name: User
  belongs_to :post

  validates :message, :post, :commenter, presence: true
end
