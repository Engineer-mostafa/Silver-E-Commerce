import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/silverpiece.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';

import './categories_screen.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<SilverPiece> favouritePieces;
  const TabsScreen( this.favouritePieces);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: MainDrawer(),
        backgroundColor: Color.fromARGB(50, 50, 50, 1),
        appBar: AppBar(
          title: Text(
            'The Silver',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Image.asset(
            'assets/images/0.png',
            fit: BoxFit.scaleDown,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourite',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CategoriesScreen(),
          FavouriteScreen(widget.favouritePieces),
        ]),
      ),
    );
  }
}
