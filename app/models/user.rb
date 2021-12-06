class User < ApplicationRecord
    has_many :comments, foreign_key: "Author_id", class_name: "Comment"
    has_many :posts, foreign_key: "Author_id", class_name: "Post"
    has_many :likes, foreign_key: "Author_id", class_name: "Like"

    def recent_posts
      recent_posts_array = []
      i = 0
      self.posts.each do |post|
        break if i > 3
        recent_posts_array << post
        i += 1
      end
    return recent_posts_array
    end
end
