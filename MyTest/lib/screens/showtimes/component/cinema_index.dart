import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/data/data.dart';
import 'package:movie_ticket_app/screens/Booking/booking_screen.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/cinema_detail.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/simpleDirection.dart';
import 'package:movie_ticket_app/screens/Detail/detail_screen.dart';
import 'package:movie_ticket_app/screens/Signup/signup_screen.dart';



class CinemaIndex extends StatefulWidget {


  final String cinemaName;
  final String cinemaAddress;
  final String cinemaImage;
  final String cinemaCity;
  final double cinemaX;
  final double cinemaY;

  CinemaIndex(this.cinemaName,this.cinemaAddress,this.cinemaImage
      ,this.cinemaCity,this.cinemaX,this.cinemaY);

  @override
  _CinemaIndexState createState() => _CinemaIndexState();
}

class _CinemaIndexState extends State<CinemaIndex> {

  bool visible = true;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    CollectionReference users = FirebaseFirestore.instance.collection('cinemas');

    return
    /*  FutureBuilder<QuerySnapshot>(
        future: users.get(),
        builder:
            ( context, snapshot) {

          if (snapshot.hasError) {
            print("Something went wrong");
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            print("Document does not exist");
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            print("Full Name: ${data['cinemaName']} ${data['cinemaX']}");
            return Text("Full Name: ${data['full_name']} ${data['last_name']}");
          }
              if(snapshot.hasData){

                final List<DocumentSnapshot> documents = snapshot.data.docs;
                print(documents.length);
                documents
                    .map((doc)  {
                    print(doc['cinemaImage']);
                    print(documents.length);
                    print("ahaha");

                });
                return ListView(
                    children: documents
                        .map((doc) => Card(
                      child: ListTile(
                        title: Text(doc['cinemaName']),
                        subtitle: Text(doc['cinemaX'].toString()),
                      ),
                    ))
                        .toList());
              }

          return Text("loading");
        },
      );*/

                InkWell(
                  onTap:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                        //  return BookingScreen();
                          return CinemaDetail();
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
                                  child: Text(widget.cinemaAddress,
                                    style: TextStyle(color: Colors.grey, fontSize: 14),
                                    textAlign: TextAlign.left),
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
              }
