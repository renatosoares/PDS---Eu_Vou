# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Category.create(titulo: 'Cafeteria', icone: 'fa fa-coffee')

category_list = [
  ["Estacionamento", "fa fa-car"],
	["Bicicletário", "fa fa-bicycle"],
	["Cafeteria", "fa fa-coffee"],
	["Hotel", "fa fa-bed"],
	["Monitoramento", "fa fa-camera-retro"],
	["Pagamento Eletrônico", "fa fa-credit-card"],
	["Área Coberta", "fa fa-umbrella"],
	["Shopping", "fa fa-shopping-cart"]

]

category_list.each do |category|
  Category.create( :titulo => category[0], :icone => category[1] )
end
