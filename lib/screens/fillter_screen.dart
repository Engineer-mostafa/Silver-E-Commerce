import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  static String pageRout = '/fillter';

  final Function filter;
  Map<String, bool> currentfilters;
  FiltersScreen(this.currentfilters,this.filter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _dontseehighprice = false;

  bool _dontseebothgender = false;

  bool _dontseenotavialablenow = false;

  @override
  initState() {
    _dontseehighprice = widget.currentfilters['higherthan200'];
    _dontseenotavialablenow = widget.currentfilters['notavailable'];
    _dontseebothgender = widget.currentfilters['bothgender'];
    super.initState();
  }

  Widget _buildSwitchTile(
      String title, String subtitle, bool currentValue, Function func) {
    return SwitchListTile(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.red,
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.white),
        ),
        value: currentValue,
        onChanged: func);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(50, 50, 50, 1),
        onPressed: () {
          final fill = {
            'higherthan200': _dontseehighprice,
            'notavailable': _dontseenotavialablenow,
            'bothgender': _dontseebothgender,
          };
          widget.filter(fill);
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(50, 50, 50, 1),
          child: Card(
              color: Color.fromARGB(50, 50, 50, 1),
              shadowColor: Colors.white,
              elevation: 0.5,
              child: Icon(Icons.save)),
        ),
      ),
      backgroundColor: Color.fromARGB(50, 50, 50, 1),
      endDrawer: MainDrawer(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        title: Text(
          'Filter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text('You Can Filter What You Need To See',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title)),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  'Element Higher Than 200\$',
                  'don\'t see element higher than 200\$',
                  _dontseehighprice,
                  (newvalue) {
                    setState(
                      () {
                        _dontseehighprice = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Both Gender',
                  'don\'t see element tnat can wear by both gender',
                  _dontseebothgender,
                  (newvalue) {
                    setState(
                      () {
                        _dontseebothgender = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Not Available',
                  'don\'t see element tnat not available now',
                  _dontseenotavialablenow,
                  (newvalue) {
                    setState(
                      () {
                        _dontseenotavialablenow = newvalue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
