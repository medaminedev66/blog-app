class User < ApplicationRecord
    has_many :comments
    has_many :posts
    has_many :likes

    def recent_posts
      self.posts.each do |post|
        puts "Post title #{post.Title}"
      end
    end
end
