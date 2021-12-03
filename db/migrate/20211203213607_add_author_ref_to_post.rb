class AddAuthorRefToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :Author, foreign_key: { to_table: :users }
  end
end
