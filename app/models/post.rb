class Post < ApplicationRecord
    belongs_to :Author_id, class_name: 'User', primary_key: :id, foreign_key: :Author_id
    has_many :likes
    has_many :comments

    def update_counter
      if self.Author_id.PostsCounter == nil
         self.Author_id.update(PostsCounter: 1)
      else
        self.Author_id.PostsCounter+=1
        self.Author_id.update(PostsCounter: self.Author_id.PostsCounter)
      end
    end
end
