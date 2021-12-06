class Post < ApplicationRecord
    belongs_to :Author_id, class_name: 'User', primary_key: :id, foreign_key: :Author_id
    has_many :likes
    has_many :comments
end
