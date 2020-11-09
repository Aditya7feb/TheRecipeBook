import 'dart:ui';

import './screens/bottom_bar.dart';

//import './screens/tabs_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TheRecipeBook',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                fontFamily: 'RalewaySemiBold',
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                fontFamily: 'RalewayThin',
                fontStyle: FontStyle.italic,
                fontSize: 20,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'RalewayLight',
              ),
            ),
      ),
      //home: CategoriesScreen(),
      //initialroute : '/',
      routes: {
        '/': (ctx) => BottomBar(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },

      //onGenerateRoute is used when the route name is generated during the entire lifecycle
      //of the app and we dont know them in advance

      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //  if(settings.name == '/meal-detail'){
      //   return ...;
      // }elseif(settings.name == '/something-else'){
      //   return ...;
      // }
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );

      // },

      // error 404 - in case when some page doesnt exist then onUnknownRoute
      //prevents the app to just crash and then routes to the page defined

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
