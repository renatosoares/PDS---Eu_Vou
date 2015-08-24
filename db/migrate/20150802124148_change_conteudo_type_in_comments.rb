class ChangeConteudoTypeInComments < ActiveRecord::Migration
  def change
    change_column :comments, :conteudo, :text
  end
end
