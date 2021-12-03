class RemoveUserRefFromLike < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :user, null: false, foreign_key: true
  end
end
