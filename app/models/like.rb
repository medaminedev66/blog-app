class Like < ApplicationRecord
  belongs_to :Author, class_name: 'User'
  belongs_to :post, counter_cache: :LikesCounter

  def update_likes_counter
    if post.likesCounter.nil?
      post.update(LikesCounter: 1)
    else
      post.likesCounter += 1
      post.update(likesCounter: post.likesCounter)
    end
  end
end
