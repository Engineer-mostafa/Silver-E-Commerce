import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/silverpiece.dart';
import '../3.1 dummy_data.dart.dart';

class ItemDetailsPage extends StatelessWidget {
  final Function setorremoveFavourite;
  final Function isFavourite;
  static String pageRout = '/item-details-page';

  const ItemDetailsPage(this.setorremoveFavourite, this.isFavourite) ;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 130,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.green,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final argu =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final boxTitle = argu['title'];
    final boxId = argu['id'];
    final selecteditemfordetails =
        DUMMY_SILVER_PIECES.firstWhere((piece) => piece.id == boxId);
    final List<String> model = [
      '$boxTitle',
      'Italian Silver',
      'Caliber 925',
      selecteditemfordetails.gender == Gender.Female
          ? 'For Females Only'
          : selecteditemfordetails.gender == Gender.Male
              ? 'For Males Only'
              : 'For Both'
    ];
    final List<String> steps = [
      'Visit Our Page TheSilver',
      'Choose the element you want',
      'Tell us about this in page',
      'Or call us: 01128306813'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(boxTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  selecteditemfordetails.img,
                  fit: BoxFit.cover,
                )),
            buildSectionTitle(context, 'Model'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      child: Center(
                          child: Text(
                        model[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      ))),
                ),
                itemCount: model.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 100),
              child: Row(
                children: [
                  buildSectionTitle(context, 'Steps To Buy'),
                  Container(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/images/bag.png'))
                ],
              ),
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text('${(index + 1)}'),
                      ),
                      title: Card(
                        elevation: 6,
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            steps[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>setorremoveFavourite(boxId),
        child: Icon(isFavourite(boxId) ? Icons.star:Icons.star_border),
      ),
    );
  }
}
