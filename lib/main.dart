import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meal_app/DUMMY_DATA.dart';
import 'package:meal_app/Detail_meal_screen.dart';
import 'package:meal_app/MODEL/CATEGORY.dart';
import 'package:meal_app/Screen_Categories.dart';
import 'package:meal_app/meal_Categories_screen.dart';
import 'package:meal_app/Screen_Tab.dart';
import 'package:meal_app/Screen_filter.dart';
import './MODEL/meal.dart';
import 'package:meal_app/Home.dart';

// Future fetchStr() async {
//   await new Future.delayed(const Duration(seconds: 5), () {});
//   return 'Hello World';
// }

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>  {

  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouritemeals = [];
  List<Category> _checkitems = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String mealId) {
    final existingIndex = _favouritemeals.indexWhere((meal) =>meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favouritemeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritemeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),);
      });
    }
  }
  bool _isMealfavourite (String id) {
    return _favouritemeals.any((meal) => meal.id == id);
  }

  void _toggleCheck(String mealId) {
    final existingIndex = _checkitems.indexWhere((meal) =>meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _checkitems.removeAt(existingIndex);
      });
      print('existing');
    } else {
      setState(() {
        _checkitems.add(DUMMY_CATEGORIES.firstWhere((meal) => meal.id == mealId),);
      });
      print('new');

    }
  }
  bool _ischeckitem(String id) {
    return _checkitems.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MEAL_APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.orange,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: ScreenCategories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => ScreenTab(toggleCheck
            :_toggleCheck, ischeckitem:_ischeckitem,favouriteMeals: _favouritemeals,checkitems: _checkitems,),
        MealCategoriesScreen.routeName: (ctx) => MealCategoriesScreen(_availableMeals),
        DetailMealScreen.routeName: (ctx) => DetailMealScreen(_toggleFavourites, _isMealfavourite),
        ScreenFilter.routeName: (ctx) => ScreenFilter(_filters, _setFilters),
        home.routeName: (ctx) => home(toggleCheck
            :_toggleCheck, ischeckitem:_ischeckitem),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute:  (settings) {
        return MaterialPageRoute (builder:  (ctx) => ScreenCategories(checkitems: _checkitems,),);
      },
    );
  }
}

