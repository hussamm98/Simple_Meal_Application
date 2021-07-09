import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meals"),),
      body: GridView(
        padding: EdgeInsets.all(22),
        children: DUMMY_CATEGORIES.map((catData) =>
        CategoryItem(catData.id, catData.title, catData.color),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
        ),
      ),
    );
  }
}
