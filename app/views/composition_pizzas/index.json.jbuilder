json.array!(@composition_pizzas) do |composition_pizza|
  json.extract! composition_pizza, :id
  json.url composition_pizza_url(composition_pizza, format: :json)
end
