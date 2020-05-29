require "rails_helper"

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    it "I see the chef's name and a link to view ingredients this chef uses" do

      chef1 = Chef.create(name: "Ben")
      chef2 = Chef.create(name: "Tim")
      dish = Dish.create( name: "BBQ Pork Mac & Cheese",
                          description: "Cheesy goodness",
                          chef_id: chef1.id)
      dish2 = Dish.create( name: "BBQ Brisket",
                          description: "Smokey",
                          chef_id: chef2.id)
      dish3 = Dish.create( name: "Chicken Verde Mac & Cheese",
                          description: "Cheesy Chicken Mac",
                          chef_id: chef1.id)
      dish4 = Dish.create( name: "Nacho Verde",
                          description: "Nachos with Salsa Verde",
                          chef_id: chef1.id)

      cheese = Ingredient.create( name: "Cheese sauce",
                                  calories: 500)
      nachos = Ingredient.create( name: "Nachos",
                                  calories: 1000)
      chicken = Ingredient.create( name: "Chicken breast",
                                  calories: 200)
      verde = Ingredient.create( name: "Salsa Verde",
                                  calories: 25)
      cavatappi = Ingredient.create(  name: "Cavatappi noodles",
                                      calories: 500)
      pork = Ingredient.create( name: "BBQ pork",
                                calories: 500)

      brisket = Ingredient.create( name: "BBQ Brisket", calories: 750)

      dish_ingredient1 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: cheese.id)
      dish_ingredient2 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: cavatappi.id)
      dish_ingredient3 = DishIngredient.create( dish_id: dish.id,
                                                ingredient_id: pork.id)
      dish_ingredient4 = DishIngredient.create( dish_id: dish2.id, ingredient_id: brisket.id)
      dish_ingredient5 = DishIngredient.create( dish_id: dish3.id, ingredient_id: cheese.id)
      dish_ingredient6 = DishIngredient.create( dish_id: dish3.id, ingredient_id: chicken.id)
      dish_ingredient6 = DishIngredient.create( dish_id: dish3.id, ingredient_id: verde.id)
      dish_ingredient7 = DishIngredient.create( dish_id: dish4.id, ingredient_id: verde.id)
      dish_ingredient8 = DishIngredient.create( dish_id: dish4.id, ingredient_id: nachos.id)
      dish_ingredient9 = DishIngredient.create( dish_id: dish4.id, ingredient_id: cheese.id)
      dish_ingredient9 = DishIngredient.create( dish_id: dish4.id, ingredient_id: chicken.id)

      visit "/chefs/#{chef1.id}"

      expect(page).to have_content(chef1.name)

      expect(page).to have_content("Most Popular Ingredients")
      expect(page).to have_content(cheese.name)
      expect(page).to have_content(verde.name)
      expect(page).to have_content(chicken.name)
      click_on "Ingredient's List"

      expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")
      expect(page).to have_content(cheese.name)
      expect(page).to have_content(cavatappi.name)
      expect(page).to have_content(pork.name)

    end
  end
end
