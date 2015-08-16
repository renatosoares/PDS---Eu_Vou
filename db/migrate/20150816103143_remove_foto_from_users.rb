class RemoveFotoFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :foto, :string
  end
end
