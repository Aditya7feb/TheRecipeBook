import 'dart:ui';

import 'package:TheRecipeBook/category_meals_screen.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
