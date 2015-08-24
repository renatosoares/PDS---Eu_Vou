class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :titulo
      t.text :descricao
      t.string :endereco
      t.datetime :data
      t.string :imagem

      t.timestamps null: false
    end
  end
end
