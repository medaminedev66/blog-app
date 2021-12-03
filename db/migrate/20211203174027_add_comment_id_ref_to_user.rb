class AddCommentIdRefToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :comment, null: false, foreign_key: true
  end
end
