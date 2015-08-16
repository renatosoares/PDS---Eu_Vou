class RemoveImagemFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :imagem, :string
  end
end
