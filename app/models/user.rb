class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, uniqueness: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: 'author_id', class_name: 'Comment'
  has_many :posts, foreign_key: 'author_id', class_name: 'Post'
  has_many :likes, foreign_key: 'author_id', class_name: 'Like'

  ROLES = %i[admin default].freeze
  

  def is?(requested_role)
    role == requested_role.to_s
  end

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
