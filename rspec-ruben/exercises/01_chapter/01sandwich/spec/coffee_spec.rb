class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    return 1.00 + ingredients.size * 0.25
  end

  def color
    return ingredients.include?(:milk) ? :light : :dark
  end

  def temperature
    return ingredients.include?(:milk) ? 190.0 : 206.0
  end
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with_milk' do
    before { coffee.add :milk }

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end

    it 'is light in color' do
      # pending 'Color not implemented yet'
      expect(coffee.color).to be(:light)
    end

    it 'is cooler than 200 degrees Fahrenheit' do
      # pending 'Temperature not implemented yet'
      expect(coffee.temperature).to be < 200.0
    end


  end
end
