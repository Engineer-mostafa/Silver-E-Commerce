import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/fillter_screen.dart';

class MainDrawer extends StatelessWidget {
  // ignore: missing_return
  Widget buildListTile(String title, IconData ic, String img) {}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'The Silver',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 10,
                      child: ListTile(
              leading: Image.asset(
                'assets/images/necklogo.png',
                scale: MediaQuery.of(context).size.width / 80,
              ),
              title: Text(
                'Silver Items',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ),
         
          Card(
            elevation: 10,
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
                size: MediaQuery.of(context).size.height / 15,
              ),
              title: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(FiltersScreen.pageRout);
              },
            ),
          ),
        ],
      ),
    );
  }
}
