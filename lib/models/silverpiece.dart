import 'package:flutter/material.dart';

enum Gender {
  Male,
  Female,
  Both,
}



class SilverPiece {
  final String id;
  final String title;
  final String price;
  final Gender gender;
  final List<String> avialableSizes;
  final List<String> notavialableSizes;
  final bool isAvailible;
  final List<String> categories;
  final String img;
  // ignore: non_constant_identifier_names
  final Icon icon_isAvailible;

  const SilverPiece({
    @required this.id,
    @required this.price,
    // ignore: non_constant_identifier_names
    @required this.icon_isAvailible,
    @required this.notavialableSizes,
    @required this.title,
    @required this.gender,
    @required this.avialableSizes,
    @required this.isAvailible,
    @required this.img,
    @required this.categories,
  });
}
