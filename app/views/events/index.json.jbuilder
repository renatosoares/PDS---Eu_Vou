json.array!(@events) do |event|
  json.extract! event, :id, :titulo, :descricao, :endereco, :data, :imagem
  json.url event_url(event, format: :json)
end
