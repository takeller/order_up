require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe "methods" do
    it "#total_calories" do
      chef = Chef.create(name: "Ben")
      dish = Dish.create( name: "BBQ Pork Mac & Cheese",
                          description: "Cheesy goodness",
                          chef_id: chef.id)

      cheese = Ingredient.create( name: "Cheese sauce",
                                  calories: 500)
      cavatappi = Ingredient.create(  name: "Cavatappi noodles",
                                      calories: 500)
      pork = Ingredient.create( name: "BBQ pork",
                                calories: 500)

      dish_ingredient1 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: cheese.id)
      dish_ingredient2 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: cavatappi.id)
      dish_ingredient3 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: pork.id)

      expect(dish.total_calories).to eq(1500)

    end
  end
end
