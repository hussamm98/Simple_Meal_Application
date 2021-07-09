import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
void selectCategory(BuildContext ctx){
  Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
  arguments: {
    'id' : id,
    'title':title,
  });
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Center(child: Text(title , style: Theme.of(context).textTheme.headline6,)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.4),
                color,
              ],
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
