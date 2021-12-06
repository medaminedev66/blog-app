class Like < ApplicationRecord
  belongs_to :Author_id, class_name: 'User', primary_key: :id, foreign_key: :Author_id
  belongs_to :post_id, class_name: 'Post', primary_key: :id, foreign_key: :post_id
end
