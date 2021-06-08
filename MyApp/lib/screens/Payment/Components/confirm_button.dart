import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/screens/booking/booking_screen.dart';

class ConfirmButton extends StatefulWidget {
  final String movieName;

  ConfirmButton(this.movieName);

  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton>{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.08,
        margin: EdgeInsets.symmetric(vertical: size.width * 0.05),
        child: FlatButton(
          color: secondary,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookingScreen(movieName: widget.movieName),
                ));
          },
          child: Text(
            'Confirm',
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}