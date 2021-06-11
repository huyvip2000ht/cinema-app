import 'package:flutter/material.dart';
import 'package:movie_ticket_app/models/movie_model.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/movie_index.dart';


class DetailMoviePage extends StatefulWidget {

  MovieIndex movie;



  DetailMoviePage(this.movie);

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
         widget.movie.movieName,
          style: TextStyle(
            color: white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: secondaryColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,

              child: Stack(
                /*decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      secondaryColor,
                      secondaryColor.withOpacity(0.8),
                      secondaryColor.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),*/

                children: [
                  Image.asset(
                    widget.movie.movieImage,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                   // fit: BoxFit.fitHeight,
                  ),
                  Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.movieName,
                        style: TextStyle(
                          color: white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,


                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.movie.movieLength,
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            widget.movie.movieRating.toString(),
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 17,
                            ),
                          ),
                          Icon(Icons.star,color: Colors.yellow,),
                          SizedBox(width: 5),


                        ],
                      )
                    ],
                  ),
                ),]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Overview",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                widget.movie.movieOverview,
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 17,
                ),
              ),
            ),
            // if (widget.movie.castList.length > 0) ...[
            //   Padding(
            //     padding: const EdgeInsets.only(left: 15, top: 15),
            //     child: Text(
            //       "Cast",
            //       style: TextStyle(
            //         color: white.withOpacity(0.7),
            //         fontSize: 22,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            //   Container(
            //     height: 100,
            //     padding: EdgeInsets.only(left: 15, top: 10),
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: widget.movie.castList.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: EdgeInsets.only(right: 15),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Container(
            //                 height: 70,
            //                 width: 70,
            //                 decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   image: DecorationImage(
            //                     fit: BoxFit.cover,
            //                     image: AssetImage(
            //                       widget.movie.castList[index].name,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Text(
            //                 widget.movie.castList[index].name,
            //                 style: TextStyle(
            //                   color: white.withOpacity(0.7),
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   )
            // ]
          ],
        ),
      ),
    );
  }
}