class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    ingredients = []
    dishes.each do |dish|
      ingredients << dish.ingredients
    end
    ingredients.flatten!
    ingredients.uniq!
    ingredients
  end
end
