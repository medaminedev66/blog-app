class AddAuthorRefToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :Author, on_delete: :cascade, foreign_key: { to_table: :users }
  end
end
