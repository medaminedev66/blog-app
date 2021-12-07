class AddColunmToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Photo, :text
  end
end
