class AddAuthorIdRefToLike < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :Author, foreign_key: { to_table: :users }
  end
end
