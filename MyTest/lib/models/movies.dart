import 'dart:ffi';

import 'package:flutter/material.dart';

class Movie{
  String id;
  String title;
  String logo;
  List <String> categorires;
  double rating;
  DateTime time;
  String description;
  DateTime realeased_Date;
  String age_Limit;
  String language;
  Int8 screen;
  String director;
  String cast;
  Movie({
    @required this.id,
    @required this.title,
    @required this.logo,
    @required this.categorires,
    @required this.rating,
    @required this.time,
    @required this.description,
    @required this.realeased_Date,
    @required this.age_Limit,
    @required this.language,
    this.screen,
    this.director,
    this.cast,

  });

}
