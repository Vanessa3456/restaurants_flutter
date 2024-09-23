class FoodCategory {
  String name;
  int numberOfRestaurants;
  String imageUrl;

  FoodCategory(this.name, this.numberOfRestaurants, this.imageUrl);
}

List<FoodCategory> categories = [
  FoodCategory('Dessert', 16, 'lib/imagess/dessert.png'),
  FoodCategory('Vegetarian', 20, 'lib/imagess/vegetarian.png'),
  FoodCategory('Burger', 21, 'lib/imagess/burger.png'),
  FoodCategory('Asian', 16, 'lib/imagess/asian.png'),
  FoodCategory('Italian', 18, 'lib/imagess/italian.png'),
  FoodCategory('Mexican', 15, 'lib/imagess/mexican.png'),
  FoodCategory('Seafood', 14, 'lib/imagess/seafood.png'),
  FoodCategory('Pizza', 19, 'lib/imagess/pizza.png'),
  FoodCategory('Sushi', 15, 'lib/imagess/sushi.png'),
  FoodCategory('Coffee', 22, 'lib/imagess/coffee.png'),
  FoodCategory('Fast Food', 23, 'lib/imagess/fast_food.png'),
  FoodCategory('Salad', 18, 'lib/imagess/salad.png'),
];
