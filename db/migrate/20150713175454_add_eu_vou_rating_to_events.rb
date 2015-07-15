class AddEuVouRatingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eu_vou_rating, :integer, :default => 0
  end
end
