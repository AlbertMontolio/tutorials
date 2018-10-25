class Sandwich
  attr_reader :taste
  # attr_writer :toppings

  def initialize(taste, toppings)
    @taste = taste
    @toppings = toppings
  end

  # def taste
  #   return @taste
  # end

  def toppings=(toppings)
    @toppings = toppings
  end

end

sandwhich = Sandwich.new("delicious", ["pepper", "tomatoe"])
p sandwhich
p sandwhich.taste
sandwhich.toppings = ["hola"]

# Sandwich = Struct.new(:taste, :toppings)

# sandwich = Sandwich.new("delicious", ["pepper", "tomatoe"])
# p sandwich
# p sandwich.taste
