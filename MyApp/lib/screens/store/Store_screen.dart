import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/components/bottomNavbar.dart';
import 'package:movie_ticket_app/components/rounded_button.dart';
import 'package:movie_ticket_app/components/rounded_select_field.dart';
import 'package:movie_ticket_app/components/square_button.dart';
import 'package:movie_ticket_app/components/text_field_container.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/movie_index.dart';
import 'package:movie_ticket_app/screens/HomePage/components/background_list_view.dart';
import 'package:movie_ticket_app/screens/HomePage/components/custom_appbar.dart';
import 'package:movie_ticket_app/screens/HomePage/components/movie_list_view.dart';
// import 'package:movie_ticket_app/screens/showtimes/Showtimes_screen.dart';
import 'package:movie_ticket_app/screens/store/components/body.dart';
import 'package:movie_ticket_app/screens/store/components/film_index.dart';
import 'package:movie_ticket_app/screens/store/components/store_appbar.dart';

class StoreScreen extends StatefulWidget{
  @override
  _StoreScreenState createState() => _StoreScreenState();

}

class _StoreScreenState extends State<StoreScreen>{
  CollectionReference cinemas = FirebaseFirestore.instance.collection('cinemas');

  int _seconds = 1;
  String _filmFilter = "";
  List<MovieIndex> _movieIndex=[];
  bool _isLoaded = false;


  List<bool> _hasBeenPressed = [
    false, false, false
  ];

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery
        .of(context)
        .size;

    takeData();
    return new MyInheritedWidget(
        secondsToDisplay: _seconds,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: "Menu",
              )
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context){
                        return Scaffold(
                          appBar: AppBar(
                            title: Text(
                              "Notification",
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
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Text("Booking by Film",
                      style: TextStyle(fontSize: 24,color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  )
                ),

              Container(
                width: size.height*0.65,


                  child: Column(
                        children: [
                          SingleChildScrollView(

                            child:ListMovie(_movieIndex),

                          )
                      ]),

              )


              ]
            ),
          ),
          drawer: _buildDrawer(),
        )
    );
  }
  void _addPressed(String filter) {
    setState(() {
      _filmFilter = filter;
    });
  }
  Future<void> takeData() async {

    var collectionMovies= FirebaseFirestore.instance.collection('movies');
    var querySnapshotMovies = await collectionMovies.get();

    if(_isLoaded == false){
      setState(() {

        for (var doc in querySnapshotMovies.docs) {
          Map<String, dynamic> data = doc.data();

          _movieIndex.add(new MovieIndex(doc.id,data['movieName'], data['movieCategory'], data['movieImage'],
              data['movieLength'], data['movieShowtime'], data['movieOverview'],data['movieRating']));


          print(doc.id);
          //  var fooValue = data['cinemaImage'];
        }




        _isLoaded = true;
      });
    }
  }
}

Widget _buildDrawer() {
  return Drawer(
    child: Container(
      color: Color(0xff262a30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 250,
            child: Container(
              color: Color(0xff181a1c),
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: double.maxFinite,
                    child: Image(
                      image: AssetImage(''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black54, Colors.transparent],
                            ),
                          ),
                          child: Text(
                            'Movies Ticket',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Home',
              style:
              TextStyle(color: Colors.white70, fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading:
            Icon(Icons.movie_creation, color: Colors.white),
            title: Text(
              'Showtimes',
              style:
              TextStyle(color: Colors.white70, fontSize: 16),
            ),
            onTap: () {},
          ),
          Divider(color: Colors.white54),
          ListTile(
            leading: Icon(Icons.store, color: Colors.white),
            title: Text(
              'Store',
              style:
              TextStyle(color: Colors.white70, fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings_input_svideo_rounded, color: Colors.white),
            title: Text(
              'Promotions',
              style:
              TextStyle(color: Colors.white70, fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading:
            Icon(Icons.contact_phone, color: Colors.white),
            title: Text(
              'Account Information',
              style:
              TextStyle(color: Colors.white70, fontSize: 16),
            ),
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}


class ListMovie extends StatelessWidget{
  List<MovieIndex> _movieIndex;
  ListMovie(this._movieIndex);

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
    );

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
