import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/body.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/simpleDirection.dart';
import 'package:movie_ticket_app/screens/showtimes/Showtimes_screen.dart';

class CinemaDetail extends StatefulWidget {
  const CinemaDetail({Key key}) : super(key: key);

  @override
  _CinemaDetailState createState() => _CinemaDetailState();
}

class _CinemaDetailState extends State<CinemaDetail> {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}