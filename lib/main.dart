import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/3.1%20dummy_data.dart.dart';
import './models/silverpiece.dart';
import './screens/fillter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/item_detials_page.dart';
import './screens/selected_category_silver_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _fillters = {
    'higherthan200': false,
    'notavailable': false,
    'bothgender': false,
  };
  List<SilverPiece> _availablepieces = DUMMY_SILVER_PIECES;
  List<SilverPiece> _favouritePieces = [];
  bool _isFavourite(String id) {
    return _favouritePieces.any((element) => element.id == id);
  }

  void _setorremoveFavourite(String pieceId) {
    final existingPiece =
        _favouritePieces.indexWhere((piece) => piece.id == pieceId);
    if (existingPiece >= 0)
      setState(() {
        _favouritePieces.removeAt(existingPiece);
      });
    else
      setState(() {
        _favouritePieces.insert(
            0, _availablepieces.firstWhere((piece) => piece.id == pieceId));
      });
  }

  void _setFillters(Map<String, bool> filterData) {
    setState(() {
      _fillters = filterData;
      _availablepieces = DUMMY_SILVER_PIECES.where((piece) {
        if (_fillters['higherthan200'] && double.parse(piece.price) > 200.0) {
          print('hi');
          return false;
        }
        if (_fillters['notavailable'] && !piece.isAvailible) return false;
        if (_fillters['bothgender'] && piece.gender == Gender.Both)
          return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Silver',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 0, 0, 1),
        accentColor: Colors.white,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            // ignore: deprecated_member_use
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            // ignore: deprecated_member_use
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            // ignore: deprecated_member_use
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouritePieces),
        SelectedCategorySilvetScreen.pageRout: (ctx) =>
            SelectedCategorySilvetScreen(_availablepieces , ),
        ItemDetailsPage.pageRout: (ctx) =>
            ItemDetailsPage(_setorremoveFavourite,_isFavourite),
        FiltersScreen.pageRout: (ctx) => FiltersScreen(_fillters, _setFillters),
      },
    );
  }
}
