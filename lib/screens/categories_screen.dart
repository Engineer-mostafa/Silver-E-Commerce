import 'package:flutter/material.dart';
import '../3.1 dummy_data.dart.dart';
import '../widgets/category_box.dart';

class CategoriesScreen extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Container(
          child: GridView(
            
            padding: const EdgeInsets.all(25),
            children: DUMMY_CATEGORIES
                .map((cat) => CategoryBox(id: cat.id,color: cat.color, title: cat.title , img: cat.img))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200,
              
            ),
          ),
    );
  }
}
