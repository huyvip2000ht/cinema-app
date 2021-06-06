import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double width;
  final double height;
  const SquareButton({
    Key key,
    this.text,
    this.press,
    this.color = white,
    this.textColor = Colors.white,
    this.width,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.grey),
          left: BorderSide(width: 1.0, color: Colors.grey),
          right: BorderSide(width: 1.0, color: Colors.grey),
          bottom: BorderSide(width: 1.0, color: Colors.grey),

        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),

      ),

      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      width: this.width,
      height: this.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: RaisedButton(

          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
