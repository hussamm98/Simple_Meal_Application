import 'package:flutter/material.dart';

import './dummy_data.dart';
import './modules/meal.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan ': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

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
  void _toggleFavorite(String mealId){
   final existingindex = _favoriteMeals.indexWhere((meal) => meal.id==mealId);

   if (existingindex>=0){
     setState(() {
       _favoriteMeals.removeAt(existingindex);
     });
   }
   else {
     setState(() {
       _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
     });
   }
  }
  bool isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hossam Static Simple Meal Application',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite ,isMealFavorite ),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters ,_filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Application"),
      ),
      body: null,
    );
  }
}
