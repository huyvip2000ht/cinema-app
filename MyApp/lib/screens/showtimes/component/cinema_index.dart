import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/data/data.dart';
import 'package:movie_ticket_app/screens/Booking/booking_screen.dart';
import 'package:movie_ticket_app/screens/Signup/signup_screen.dart';



class CinemaIndex extends StatefulWidget {

  /*var cinemaName = "BHD Star The Garden";
  var cinemaAddress = "tang 4, 5 .....";
  var cinemaImage = "../images/image.jpg";*/
  final String cinemaName;
  final String cinemaAddress;
  final String cinemaImage;
  final String cinemaCity;

  CinemaIndex(this.cinemaName,this.cinemaAddress,this.cinemaImage,this.cinemaCity);

  @override
  _CinemaIndexState createState() => _CinemaIndexState();
}

class _CinemaIndexState extends State<CinemaIndex> {
 /* var cinemaName = "BHD Star The Garden";
  var cinemaAddress = "tang 4, 5 .....";
  var cinemaImage = "../images/image.jpg";*/

  bool visible = true;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    return
                InkWell(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                        //  return BookingScreen();
                        },
                      ),
                    );
                  },
               //     borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Card(
                    color: Colors.black,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),//EdgeInsets.symmetric(horizontal: appPadding + 2),
                   // padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(

                      children: <Widget>[
                        Expanded(
                            flex: 2,

                            child:
                                ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    child: Image(image: AssetImage(widget.cinemaImage)),
                                )

                        ),
                        Container(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisSize:MainAxisSize.min,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.cinemaName,
                                style: TextStyle(color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                children:[
                                  Icon(
                                    Icons.location_on,
                                    color: kPrimaryColor,
                                  ),
                                  Text(widget.cinemaAddress,
                                    style: TextStyle(color: Colors.grey, fontSize: 14),
                                    textAlign: TextAlign.left),
                                ]
                              )

                            ],

                          ),
                        ),
                      ],
                    ),
                  ));
                }
              }
