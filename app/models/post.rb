class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :likes
    has_many :comments

    def update_counter
      if author.PostsCounter == nil
         author.update(PostsCounter: 1)
      else
        author.PostsCounter+=1
        author.update(PostsCounter: author.PostsCounter)
      end
    end

    def recent_comments
      comments.limit(5).order(created_at: desc)
    end
end
