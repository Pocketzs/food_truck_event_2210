require 'rspec'
require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  describe '#initialize' do
    it 'exists and has attributes' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_a FoodTruck
      expect(food_truck.name).to eq 'Rocky Mountain Pies'
      expect(food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'checks the quantity of an Item on the food truck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq 0
    end
  end

  describe '#stock' do
    it 'can stock an item on the food truck' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1: 30})
      expect(food_truck.check_stock(item1)).to eq 30
    end
  end
end