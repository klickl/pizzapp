module PizzasHelper
  def values_hidden(pizza)
    result = ''
    if pizza.has_ingredients?
      pizza.ingredients.each do |p|
        result += p.name
        if p != pizza.ingredients.last
          result +=','
        end
      end
    else
      result=''
    end
    result
  end
end
