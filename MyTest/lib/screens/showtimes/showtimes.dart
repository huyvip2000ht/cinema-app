import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/showtimes/Showtimes_screen.dart';
import 'package:movie_ticket_app/screens/showtimes/component/test.dart';

class Showtimes extends StatefulWidget {
  const Showtimes({Key key}) : super(key: key);

  @override
  _ShowtimesState createState() => _ShowtimesState();
}

class _ShowtimesState extends State<Showtimes> {
  @override
  Widget build(BuildContext context) {
    return ShowtimesScreen();
   // return UserInformation();
  }
}
