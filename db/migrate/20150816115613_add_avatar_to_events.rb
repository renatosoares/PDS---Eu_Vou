class AddAvatarToEvents < ActiveRecord::Migration
  def up
    add_attachment :events, :avatar
  end

  def down
    remove_attachment :events, :avatar
  end
end
