import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/data/data.dart';
import 'package:movie_ticket_app/screens/Booking/booking_screen.dart';
import 'package:movie_ticket_app/screens/Signup/signup_screen.dart';
import 'package:movie_ticket_app/screens/showtimes/component/cinema_index.dart';

class FilmIndex extends StatefulWidget{
  final String filmName;
  final double rating;
  final String posterphim;
  final String cottruyen;

  FilmIndex(this.filmName, this.rating, this.posterphim, this.cottruyen);

  @override
  _FilmIndexState createState() => _FilmIndexState();

}

class _FilmIndexState extends State<FilmIndex>{
  bool visible = true;

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery
        .of(context)
        .size;
    return
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){

                        },
                    ),
                  );
                },
                child: Card(
                  color: Colors.black,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child:
                                Container(
                                  height: 100,
                                  child:
                                    Container(
                                      height: 100,
                                      child:ClipRRect(
                                        child: Image.asset(
                                          widget.posterphim,

                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    )
                                )
                      ),
                      Container(
                        width: 20,
                      ),
                      Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.filmName,
                                style: TextStyle(color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.auto_stories,
                                    color: kPrimaryColor,
                                  ),
                                  Text(widget.cottruyen,
                                      style: TextStyle(color: Colors.grey, fontSize: 14),
                                      textAlign: TextAlign.left),
                                ]
                              )
                            ],
                          ),
                      ),
                    ],
                  ),
                )
              );
  }
}