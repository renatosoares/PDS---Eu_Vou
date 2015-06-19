class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :titulo
      t.string :icone

      t.timestamps null: false
    end
  end
end
