require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "methods" do
    it "#all_ingredients" do
      chef = Chef.create(name: "Ben")
      chef2 = Chef.create(name: "Tim")
      dish = Dish.create( name: "BBQ Pork Mac & Cheese",
                          description: "Cheesy goodness",
                          chef_id: chef.id)
      dish2 = Dish.create( name: "BBQ Brisket",
                          description: "Smokey",
                          chef_id: chef2.id)
      dish3 = Dish.create( name: "Brisket Nachos",
                          description: "Smokey nachos",
                          chef_id: chef2.id)

      cheese = Ingredient.create( name: "Cheese sauce",
                                  calories: 500)
      cavatappi = Ingredient.create(  name: "Cavatappi noodles",
                                      calories: 500)
      pork = Ingredient.create( name: "BBQ pork",
                                calories: 500)

      brisket = Ingredient.create( name: "BBQ Brisket", calories: 750)
      nachos = Ingredient.create( name: "Nachos", calories: 1000)

      dish_ingredient1 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: cheese.id)
      dish_ingredient2 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: cavatappi.id)
      dish_ingredient3 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: pork.id)
      dish_ingredient4 = DishIngredient.create( dish_id: dish2.id, ingredient_id: brisket.id)
      dish_ingredient5 = DishIngredient.create( dish_id: dish3.id, ingredient_id: brisket.id)
      dish_ingredient5 = DishIngredient.create( dish_id: dish3.id, ingredient_id: nachos.id)

      expect(chef.all_ingredients).to eq([cheese, cavatappi, pork])
      expect(chef2.all_ingredients).to eq([brisket, nachos])
    end
  end
end
