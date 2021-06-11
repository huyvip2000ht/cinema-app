import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/data/data.dart';
import 'package:movie_ticket_app/screens/Booking/booking_screen.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/cinema_detail.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/simpleDirection.dart';
import 'package:movie_ticket_app/screens/Detail/detail_screen.dart';
import 'package:movie_ticket_app/screens/Signup/signup_screen.dart';
import 'package:wemapgl/wemapgl.dart';



class CinemaIndex extends StatefulWidget implements Comparable<CinemaIndex> {

  final String cinemaId;
  final String cinemaName;
  final String cinemaAddress;
  final String cinemaImage;
  final String cinemaCity;
  final double cinemaX;
  final double cinemaY;
  final double fakeX;
  final double fakeY;
   double distance;

  CinemaIndex(this.cinemaId,this.cinemaName,this.cinemaAddress,this.cinemaImage
      ,this.cinemaCity,this.cinemaX,this.cinemaY, this.fakeX, this.fakeY);


  @override
  _CinemaIndexState createState() => _CinemaIndexState();

  @override
  int compareTo(CinemaIndex other) {
    /*if (distance < other.distance) {
      return -1;
    } else if (distance > other.distance) {
      return 1;
    } else {
      return 0;
    }*/
    print(distance.toString() + "  " + other.distance.toString());
    return 0;
  }
}

class _CinemaIndexState extends State<CinemaIndex> {

  bool visible = true;
  WeMapDirections directionAPI = WeMapDirections();


  String text="";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    CollectionReference users = FirebaseFirestore.instance.collection('cinemas');
    widget.distance = 0;
    getDistance();

    if(widget.cinemaId.isEmpty) return Container();


    return
                InkWell(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                        //  return BookingScreen();
                          return CinemaDetail(widget,widget.fakeX,widget.fakeY);
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
                                Container(
                                    height: 100,
                                    child:ClipRRect(

                                    //  borderRadius: BorderRadius.all(Radius.circular(10)),
                                      //child: Image(image: AssetImage(widget.cinemaImage)),
                                      child: Image.asset(
                                        widget.cinemaImage,

                                        fit: BoxFit.cover,
                                      ),
                                    )
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
                                  Container(
                                    width: size.width*0.55,
                                    child:Column(
                                      children:[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(widget.cinemaAddress,
                                            style: TextStyle(color: Colors.grey, fontSize: 14),
                                            textAlign: TextAlign.left),
                                      ),

                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(text,
                                            style: TextStyle(color: Colors.grey, fontSize: 14),
                                            textAlign: TextAlign.left),
                                      ),

                                    ])


                                  )
                                ]
                              )

                            ],

                          ),
                        ),
                      ],
                    ),
                  ));
                }


  @override
  void dispose() {
    super.dispose();
  }


  void getDistance() async{
    List<LatLng> points = [];


    points.add(LatLng(widget.fakeY, widget.fakeX)); //origin Point
    // points.add(LatLng(21.024412, 105.798115)); //way Point
    points.add(LatLng(widget.cinemaY, widget.cinemaX)); //destination Point
    final json = await directionAPI.getResponseMultiRoute(
        0, points); //0 = car, 1 = bike, 2 = foot
    List<LatLng> _route = directionAPI.getRoute(json);
    List<LatLng> _waypoins = directionAPI.getWayPoints(json);
    setState(() {
      widget.distance  = directionAPI.getDistance(json).toDouble()  ;

      if(widget.distance>=300000)
        text = ">300km";
      else if(widget.distance <=0){
        text= "Đang tính toán vị trí";
      }
      else if(widget.distance<1000 ){
        text = widget.distance.toString() + " m";
      }

      else if(widget.distance >= 1000 ){
      //  widget.distance = (widget.distance /1000);

     //   widget.distance = double.parse((widget.distance /1000).toStringAsFixed(1));

        text= double.parse((widget.distance /1000).toStringAsFixed(1)).toString() + " km";
      }

      text = "Cách: "+ text;


     // text = widget.distance.toString();


    }
    );



  }

}



