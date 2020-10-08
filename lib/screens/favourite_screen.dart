import 'package:flutter/material.dart';
import '../widgets/silver_item_recipes.dart';
import '../models/silverpiece.dart';

class FavouriteScreen extends StatelessWidget {
  final List<SilverPiece> favouritePieces;

  FavouriteScreen(this.favouritePieces);
  @override
  Widget build(BuildContext context) {
    if (favouritePieces.isEmpty)  {
      return Center(
        child: Text('No Favourits add yet !',style: TextStyle(fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 255, 255, 1))),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return SilverItemRecipes(
              id: favouritePieces[index].id,
              gender: Gender.Female,
              title: favouritePieces[index].title,
              img: favouritePieces[index].img,
              icon_isAvailible: favouritePieces[index].icon_isAvailible,
              isAvailible: favouritePieces[index].isAvailible,
              price: favouritePieces[index].price,
              availibleSizes: favouritePieces[index].avialableSizes,
              notavailibleSizes: favouritePieces[index].notavialableSizes);
        },
        itemCount: favouritePieces.length,
      );
    }
  }
}
