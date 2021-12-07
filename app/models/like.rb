class Like < ApplicationRecord
  belongs_to :Author, class_name: 'User'
  belongs_to :post

  def update_likes_counter
    if post.LikesCounter.nil?
      post.update(LikesCounter: 1)
    else
      post.LikesCounter += 1
      post.update(LikesCounter: post.LikesCounter)
    end
  end
end
