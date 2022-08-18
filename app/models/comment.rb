class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :CommentsCounter
  def update_comments_counter
    if post.commentsCounter.nil?
      post.update(commentsCounter: 1)
    else
      post.CommentsCounter += 1
      post.update(commentsCounter: post.commentsCounter)
    end
  end
end
