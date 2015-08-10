class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :conteudo
      t.date :data
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
