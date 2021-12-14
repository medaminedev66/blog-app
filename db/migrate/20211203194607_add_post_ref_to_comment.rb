class AddPostRefToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :post, on_delete: :cascade, null: false, foreign_key: true
  end
end
