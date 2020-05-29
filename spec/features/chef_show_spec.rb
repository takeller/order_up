require "rails_helper"

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    it "I see the chef's name and a link to view ingredients this chef uses" do

      chef = Chef.create(name: "Ben")
      chef2 = Chef.create(name: "Tim")
      dish = Dish.create( name: "BBQ Pork Mac & Cheese",
                          description: "Cheesy goodness",
                          chef_id: chef.id)
      dish2 = Dish.create( name: "BBQ Brisket",
                          description: "Smokey",
                          chef_id: chef2.id)

      cheese = Ingredient.create( name: "Cheese sauce",
                                  calories: 500)
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

      visit "/chefs/#{chef.id}"

      expect(page).to have_content(chef.name)
      click_on "Ingredient's List"

      expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
      expect(page).to have_content(cheese.name)
      expect(page).to have_content(cavatappi.name)
      expect(page).to have_content(pork.name)
      
      expect(page).to_not have_content(brisket.name)


    end
  end
end
