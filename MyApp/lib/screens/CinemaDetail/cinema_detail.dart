import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/body.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/simpleDirection.dart';
import 'package:movie_ticket_app/screens/showtimes/Showtimes_screen.dart';
import 'package:movie_ticket_app/screens/showtimes/component/cinema_index.dart';

class CinemaDetail extends StatefulWidget {
/*  const CinemaDetail({Key key}) : super(key: key);*/
  final double _fakeLocationX ;
  final double _fakeLocationY ;
//  final String _cinemaId;
  final CinemaIndex _cinemaIndex;

  CinemaDetail(this._cinemaIndex,this._fakeLocationX, this._fakeLocationY, );

  @override
  _CinemaDetailState createState() => _CinemaDetailState();
}

class _CinemaDetailState extends State<CinemaDetail> {
  @override
  Widget build(BuildContext context) {
    return Body(widget._cinemaIndex,widget._fakeLocationX,widget._fakeLocationY);
  }
}