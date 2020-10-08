import 'package:flutter/material.dart';
import '../screens/selected_category_silver_screen.dart';

class CategoryBox extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String img;
  CategoryBox(
      {@required this.id,
      @required this.color,
      @required this.title,
      @required this.img});

  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SelectedCategorySilvetScreen.pageRout,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectScreen(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Stack(
        fit: StackFit.expand,
          children:[ ClipRRect(
            
              borderRadius: BorderRadius.all(Radius.circular(15)),
            
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              
            ),
          ),
          Text(title, style: TextStyle(fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 255, 255, 1))),
          ]

          ),
    );
  }
}
