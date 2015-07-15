class AddCreatorToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :creator, index: true, foreign_key: true
  end
end
