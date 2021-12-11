class Comment < ApplicationRecord
  validates :Text, presence: true

  belongs_to :Author, class_name: 'User'
  belongs_to :post, counter_cache: :CommentsCounter
  def update_comments_counter
    if post.CommentsCounter.nil?
      post.update(CommentsCounter: 1)
    else
      post.CommentsCounter += 1
      post.update(CommentsCounter: post.CommentsCounter)
    end
  end
end
