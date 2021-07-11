import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widget/main_drawer.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
 List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  @override
  void initState() {
  _pages=[
    {
      'page': CategoriesScreen(),
      'title': "Categories",
    },
    {
      'page': FavoriteScreen(widget.favoriteMeals),
      'title': "My Favorite",
    },
  ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            // ignore: deprecated_member_use
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text("Favorite"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
