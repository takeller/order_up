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

  def popular_ingredients
    ingredients = []
    dishes.each do |dish|
      ingredients << dish.ingredients
    end
    ingredients.flatten!
    grouped_ingredients = ingredients.group_by(&:itself)
    ingredient_counts = grouped_ingredients.map { |k, v| [k, v.count] }.to_h
    sorted_ingredients = ingredient_counts.sort_by {|k,v| v}.reverse
    most_popular = sorted_ingredients[0..2].map { |ingredient| ingredient.first }

  end
end
