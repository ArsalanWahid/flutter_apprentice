import 'ingredient_model.dart';

class Recipe {
  int id;
  int servings;
  String label;
  String imageUrl;

  Recipe(
    this.id,
    this.servings,
    this.label,
    this.imageUrl,
    this.ingredients,
  );
  List<Ingredient> ingredients;
}
