class User < ApplicationRecord
  has_many :comments, foreign_key: 'Author_id', class_name: 'Comment'
  has_many :posts, foreign_key: 'author_id', class_name: 'Post'
  has_many :likes, foreign_key: 'Author_id', class_name: 'Like'

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
