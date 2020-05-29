require "rails_helper"

describe "As a visitor" do
  describe "When I visit a dishes show page" do
    it "I see a list of ingredients for this dish and the Chef that created it" do

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
      dish_ingredient2 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: pork.id)


      visit "/dishes/#{dish.id}"

      expect(page).to have_content(cheese.name)
      expect(page).to have_content(cavatappi.name)
      expect(page).to have_content(pork.name)
      expect(page).to have_content(chef.name)
      save_and_open_page
    end

    it "I see the total calorie count of the dish" do
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
      dish_ingredient2 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: pork.id)

      visit "/dishes/#{dish.id}"

      expect(page).to have_content("Total Calories: 1500")
    end
  end
end
