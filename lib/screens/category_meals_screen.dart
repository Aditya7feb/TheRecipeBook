import '../models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availaibleMeals;

  CategoryMealsScreen(this.availaibleMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    //context wont work here
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      //content works in didChangeDependencies() but not in initState()
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availaibleMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      //run to often so we need to restrice the no of time this fuuntion
      //loaded itself => we use _loadedInitData=true to restrict the function.
      //this makes the program to run only 1st time.
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere(
        (meal) => meal.id == mealId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
