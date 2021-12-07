class AddColunmsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Bio, :text
    add_column :users, :PostsCounter, :int
  end
end
