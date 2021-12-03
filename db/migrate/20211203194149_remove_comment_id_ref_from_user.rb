class RemoveCommentIdRefFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :comment, null: false, foreign_key: true
  end
end
