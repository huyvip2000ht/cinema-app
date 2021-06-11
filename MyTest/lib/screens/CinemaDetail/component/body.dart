import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/square_button.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/movie_index.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/simpleDirection.dart';
import 'package:movie_ticket_app/screens/showtimes/Showtimes_screen.dart';
import 'package:movie_ticket_app/screens/showtimes/component/cinema_index.dart';
import 'package:wemapgl/wemapgl.dart';

import 'package:movie_ticket_app/ePage.dart';
class Body extends StatefulWidget {
  /*const Body({
    Key key,
  }) : super(key: key);*/
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body>{
  CollectionReference cinemas = FirebaseFirestore.instance.collection('cinemas');
  double _fakeLocationX = 105.810697;
  double _fakeLocationY = 21.023506;
  double _cinemaX = 105.776147;
  double _cinemaY = 21.013668;


  List<bool>_hasBeenPressed =[
    false,false
  ];
  String _whatToShow ;

  CinemaIndex cinema = CinemaIndex("BHD Star The Garden",
  "Tầng 4 & 5,TTTM The Garden, khu đô thị The Manor,đường Mễ trì, phường Mỹ Đình 1, quận Nam Từ Liêm,Hà Nội"
  ,"assets/image/image.jpg"
  ,"HN",105.776147, 21.013668);

  List<MovieIndex> _movieIndex = <MovieIndex>[
    MovieIndex("Joker", ["Kinh di","Tâm lí"], "assets/image/image.jpg", "120", ["12h-14h","15h-17h"]),
  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return new MyInheritedWidget(
       // secondsToDisplay: _seconds,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                    /*=> Scaffold.of(context).openDrawer()*/
                  } ,
                  tooltip: "back",
                )),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text(
                            "Notifications",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                        body: Center(
                          child: Text(
                            "No notification",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        backgroundColor: Colors.black,
                      );
                    },
                  ));
                },
                tooltip: "Notifications",
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            bottomOpacity: 0.5,
          ),

          body: Container(
            //    color: Colors.red,
            child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text("BHD Star blablabla",
                          style: TextStyle(fontSize: 30,color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      )
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text("Địa chỉ: sdabsdhbasdiuabd sdhasjdhasjd ádhasbd áhdas háid ahsdii sahdasasoid sioashd ioioad d",
                          style: TextStyle(fontSize: 16,color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      )
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text("Cách bạn: 3km ~ 15 phút",
                          style: TextStyle(fontSize: 16,color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      )
                  ),


                  Container(
                      child: Row(
                        children: [
                          SquareButton(
                            text: "Các phim đang chiếu",
                            color: _hasBeenPressed[0] ? Colors.lightGreen : Colors
                                .black,
                            press: () =>
                            {
                              setState(() {
                                  _hasBeenPressed[0] = true;
                                  _hasBeenPressed[1] = false;
                                 /* _whatToShow = "movies";
                                  print(_whatToShow);*/
                                  show("movies");
                              })
                            },
                            width: size.width * 0.47,
                          ),
                          SquareButton(
                            text: "Xem trên bản đồ" ,
                            color: _hasBeenPressed[1] ? Colors.lightGreen : Colors
                                .black,
                            press: () =>
                            {
                              setState(() {
                                _hasBeenPressed[1] = true;
                                _hasBeenPressed[0] = false;
                                _whatToShow = "map";
                                show("map");
                              })
                            },
                            width: size.width * 0.47,
                          ),

                        ],
                      )
                  ),
                  ShowPage(_whatToShow,_movieIndex,_fakeLocationX,_fakeLocationY,_cinemaX,_cinemaY),
                  /*Container(
                      height: size.height * 0.59,
                      child: SingleChildScrollView(
                          child:
                          ListMovie(_movieIndex),
                         // MyList(_cinemaIndex,_cinemaFilter)
                      )
                  )*/
                ]
            ),
          ),
        //  drawer: _buildDrawer(),
          //  bottomNavigationBar: BottomNavBar(2),
        )
    );
  }

  void show(String page) {
    setState(() {
      _whatToShow = page;
      print(_whatToShow);
    });

  }
}





class ShowPage extends StatelessWidget{
  String _whatToShow;
  List<MovieIndex> _movieIndex;
  double _fakeX;
  double _fakeY;
  double _cinemaX;
  double _cinemaY;
   ShowPage(this._whatToShow,this._movieIndex,this._fakeX,this._fakeY,this._cinemaX,this._cinemaY);


  @override
  Widget build(BuildContext context) {
    print(_whatToShow);
    if(_whatToShow == "movies"){
      print("in ra movie");
      return ListMovie(_movieIndex);
    }

    else if(_whatToShow == "map" ){
      print("in ra map");
      return ShowMap(_fakeX,_fakeY,_cinemaX,_cinemaY);
    }

    return Container();
  }
}


/*
class ListMovie extends StatefulWidget{
  List<MovieIndex> _movieIndex;
  ListMovie(this._movieIndex);

  @override
  _ListMovieState  createState() => _ListMovieState(_movieIndex);

}

class _ListMovieState extends State<ListMovie>  {
*/
class ListMovie extends StatelessWidget{
  List<MovieIndex> _movieIndex;
  ListMovie(this._movieIndex);
 // _ListMovieState(this._movieIndex);

  @override
  Widget build(BuildContext context) {
    print(_movieIndex[0].movieName);
    Size size = MediaQuery
        .of(context)
        .size;
    final MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);



    return Container(
     child:Column(
       children:
         List.generate(_movieIndex.length, (index) {
           return Center(
             child: Container(
              child:_movieIndex[index],
            )
           );
           }
           )
         )
         /*Center(
           child: Container(
             //child: _movieIndex[0],
           )
         )*/
     );

  }



}
class ShowMap extends StatelessWidget {
  double _fakeX;
  double _fakeY;
  double _cinemaX;
  double _cinemaY;
  ShowMap(this._fakeX,this._fakeY,this._cinemaX,this._cinemaY);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  return Container();
    return SimpleDirectionPage();
  }

}


class MyInheritedWidget extends InheritedWidget {
  final int secondsToDisplay;

  MyInheritedWidget({
    Key key,
    @required this.secondsToDisplay,
    @required Widget child,
  }) : super(key: key, child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) =>
      secondsToDisplay != oldWidget.secondsToDisplay;
}

