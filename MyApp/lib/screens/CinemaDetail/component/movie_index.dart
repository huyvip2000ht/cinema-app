import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/Detail/detail_screen.dart';

import '../../../constants.dart';

class MovieIndex extends StatefulWidget {

  final String movieId;
  final String movieName;
  final String movieCategory;
  final String movieImage;
  final String movieLength;
  final String movieShowtime;
  final String movieOverview;
  final double movieRating;



  MovieIndex(this.movieId,this.movieName, this.movieCategory, this.movieImage,
      this.movieLength, this.movieShowtime, this.movieOverview, this.movieRating);

  @override
  _MovieIndexState createState() => _MovieIndexState();
}

class _MovieIndexState extends State<MovieIndex> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
   // return Container();
    return InkWell(
        onTap:() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                //  return BookingScreen();
                return DetailMoviePage(widget);
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
                          widget.movieImage,

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
                      widget.movieName,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                        children:[

                          Container(
                            width: size.width*0.55,
                            child: Text(widget.movieCategory.toString(),
                                style: TextStyle(color: Colors.grey, fontSize: 14),
                                textAlign: TextAlign.left),
                          )
                        ]
                    ),
                    Text("Thời lượng: " + widget.movieLength ,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.left),
                    Text("Suất chiếu: " + widget.movieShowtime.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.left),

                  ],

                ),
              ),
            ],
          ),
        ));


  }


}