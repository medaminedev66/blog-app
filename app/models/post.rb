class Post < ApplicationRecord
  validates :Title, presence: true
  validates :Text, length: { maximum: 250 }
  validates :CommentsCounter, :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', counter_cache: :PostsCounter
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  def update_counter
    if author.PostsCounter.nil?
      author.update(PostsCounter: 1)
    else
      author.PostsCounter += 1
      author.update(PostsCounter: author.PostsCounter)
    end
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
