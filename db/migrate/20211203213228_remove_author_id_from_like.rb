class RemoveAuthorIdFromLike < ActiveRecord::Migration[6.1]
  def change
    remove_column(:likes, :AuthorId_id, if_exists: true)
  end
end
