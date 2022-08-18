class AddColunmsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :postsCounter, :int, default: 0
  end
end
