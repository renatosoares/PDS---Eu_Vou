class ChangeDataInComments < ActiveRecord::Migration
  def change
    change_column :comments, :data, :datetime
  end
end
