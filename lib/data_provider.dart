import 'data_model/data_model.dart';
import 'data_model/ingredient_model.dart';

class DataProvider {
  static List<Recipe> samples = [
    Recipe(
      1,
      2,
      'Spaghetti and Meatballs',
      'assets/images/1.png',
      [
        Ingredient(
          1,
          'box',
          'Spaghetti',
        ),
        Ingredient(
          1,
          'box',
          'Frozen Meatballs',
        ),
        Ingredient(
          0.5,
          'jar',
          'sauce',
        ),
      ],
    ),
    Recipe(
      2,
      3,
      'Tomato Soup',
      'assets/images/2.png',
      [
        Ingredient(
          1,
          'can',
          'Tomato Soup',
        ),
      ],
    ),
    Recipe(
      3,
      4,
      'Grilled Cheese',
      'assets/images/3.png',
      [
        Ingredient(
          2,
          'slices',
          'Cheese',
        ),
        Ingredient(
          2,
          'slices',
          'Bread',
        ),
      ],
    ),
    Recipe(
      4,
      4,
      'Chocolate Chip Cookies',
      'assets/images/4.png',
      [
        Ingredient(
          4,
          'cups',
          'flour',
        ),
        Ingredient(
          2,
          'cups',
          'sugar',
        ),
        Ingredient(
          0.5,
          'cups',
          'chocolate chips',
        ),
      ],
    ),
    Recipe(
      5,
      4,
      'Taco Salad',
      'assets/images/5.jpeg',
      [
        Ingredient(
          4,
          'oz',
          'nachos',
        ),
        Ingredient(
          3,
          'oz',
          'taco meat',
        ),
        Ingredient(
          0.5,
          'cup',
          'cheese',
        ),
        Ingredient(
          0.25,
          'cup',
          'chopped tomatoes',
        ),
      ],
    ),
    Recipe(
      6,
      2,
      'Hawaiian Pizza',
      'assets/images/6.png',
      [
        Ingredient(
          1,
          'item',
          'pizza',
        ),
        Ingredient(
          1,
          'cup',
          'pineapple',
        ),
        Ingredient(
          8,
          'oz',
          'ham',
        ),
      ],
    )
  ];
}
