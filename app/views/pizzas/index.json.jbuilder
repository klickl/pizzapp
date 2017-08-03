json.array!(@pizzas) do |pizza|
  json.extract! pizza, :id, :name, :is_proposed
  json.url pizza_url(pizza, format: :json)
end
