class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :Author_id, :author_id 
  end
end
