import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
            fontFamily: 'RobotoCondensed'
          ),
        ),
      ),
      routes: {
        '/' : (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName :(context) => MealDetailScreen(),
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
