class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, length: { maximum: 250 }
  validates :commentsCounter, :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', counter_cache: :postsCounter
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  def update_counter
    if author.postsCounter.nil?
      author.update(postsCounter: 1)
    else
      author.postsCounter += 1
      author.update(postsCounter: author.postsCounter)
    end
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
