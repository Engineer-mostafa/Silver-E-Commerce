import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/silverpiece.dart';
import 'package:flutter_complete_guide/widgets/silver_item_recipes.dart';

class SelectedCategorySilvetScreen extends StatelessWidget {
  static String pageRout = '/category-silver-screen';
  final List<SilverPiece> avPiecesAfterFiltiration;

  const SelectedCategorySilvetScreen(this.avPiecesAfterFiltiration);
  @override
  Widget build(BuildContext context) {
    final argu =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final boxTitle = argu['title'];
    final boxId = argu['id'];
    final myItem = avPiecesAfterFiltiration.where((item) {
      return item.categories.contains(boxId);
    }).toList();
    return Scaffold(
      backgroundColor: Color.fromARGB(50, 50, 50, 1),
      appBar: AppBar(
        title: Text(
          boxTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return SilverItemRecipes(
              id: myItem[index].id,
              gender: Gender.Female,
              title: myItem[index].title,
              img: myItem[index].img,
              icon_isAvailible: myItem[index].icon_isAvailible,
              isAvailible: myItem[index].isAvailible,
              price: myItem[index].price,
              availibleSizes: myItem[index].avialableSizes,
              notavailibleSizes: myItem[index].notavialableSizes);
        },
        itemCount: myItem.length,
      ),
    );
  }
}
