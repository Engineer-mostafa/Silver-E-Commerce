import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/item_detials_page.dart';
import '../models/silverpiece.dart';

class SilverItemRecipes extends StatefulWidget {
  final String title;
  final String id;
  final String price;
  final String img;
  final Gender gender;
  final List<String> availibleSizes;
  final List<String> notavailibleSizes;
  // ignore: non_constant_identifier_names
  final Icon icon_isAvailible;
  final bool isAvailible;

  const SilverItemRecipes(
      // ignore: non_constant_identifier_names
      {@required this.title,
      @required this.availibleSizes,
      @required this.id,
      @required this.notavailibleSizes,
      @required this.price,
      @required this.img,
      @required this.gender,
      // ignore: non_constant_identifier_names
      @required this.icon_isAvailible,
      @required this.isAvailible});

  @override
  _SilverItemRecipesState createState() => _SilverItemRecipesState();
}

class _SilverItemRecipesState extends State<SilverItemRecipes> {
  String dropdownValue = 'Sizes';
  bool av = true;

   void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ItemDetailsPage.pageRout,
        arguments: {'id': widget.id, 'title': widget.title});
  }
  @override
  Widget build(BuildContext context) {
    return  Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).primaryColor,
        elevation: 10,
        shadowColor: Theme.of(context).accentColor,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
      onTap: ()=> selectScreen(context) ,
      child: Stack(
              children: [
               ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    widget.img,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    height: 50,
                    color: Colors.black54,
                    child: Text(
                      widget.title ,
                      style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,),
                      overflow: TextOverflow.fade,
                      softWrap: true,

                    ),
                  ),
                ),
              ],
            ),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 13,
                        child: Image.asset(av
                            ? 'assets/images/available.jpg'
                            : 'assets/images/notavailable.jpg'),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.isAvailible ? 'Available' : 'Not Available' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,), )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.format_size_rounded,color: Colors.white,),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 30,
                        child: DropdownButton(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            iconEnabledColor: Colors.white,
                            elevation: 16,
                            focusColor: Theme.of(context).primaryColor,
                            dropdownColor: Theme.of(context).primaryColor,
                            style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                widget.notavailibleSizes.contains(dropdownValue)
                                    ? av = false
                                    : av = true;
                              });
                            },
                            items: widget.availibleSizes.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money,color: Colors.white,),
                      
                      Text(widget.price,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: 18),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),

    );
  }
}
