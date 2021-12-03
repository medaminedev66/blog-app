class RemoveForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :likes, column: :AuthorId_id
  end
end
