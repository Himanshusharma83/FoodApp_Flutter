import 'package:flutter/material.dart';
import 'package:foodapp/widgets/CategoriesListItem.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoriesListItem(
            categoryIcon:Icons.bug_report,
            categoryName:'Burgers',
            availability:12,
            selected:true,
          ),
          CategoriesListItem(
            categoryIcon:Icons.bug_report,
            categoryName:'Rolls',
            availability:12,
            selected:false,
          ),
          CategoriesListItem(
            categoryIcon:Icons.bug_report,
            categoryName:'Pizza',
            availability:12,
            selected:false,
          ),
          CategoriesListItem(
            categoryIcon:Icons.bug_report,
            categoryName:'Momos',
            availability:12,
            selected:false,
          ),
          CategoriesListItem(
            categoryIcon:Icons.bug_report,
            categoryName:'Passta',
            availability:12,
            selected:false,
          ),
          CategoriesListItem(
            categoryIcon:Icons.bug_report,
            categoryName:'Manchurin',
            availability:12,
            selected:false,
          ),
        ],
      ),
    );
  }
}
