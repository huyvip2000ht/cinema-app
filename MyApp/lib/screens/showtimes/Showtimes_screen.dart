import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/bottomNavbar.dart';
import 'package:movie_ticket_app/components/rounded_button.dart';
import 'package:movie_ticket_app/components/rounded_select_field.dart';
import 'package:movie_ticket_app/components/square_button.dart';
import 'package:movie_ticket_app/components/text_field_container.dart';
import 'package:movie_ticket_app/screens/Showtimes/component/body.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/screens/HomePage/components/background_list_view.dart';
import 'package:movie_ticket_app/screens/HomePage/components/custom_appbar.dart';
import 'package:movie_ticket_app/screens/HomePage/components/movie_list_view.dart';
import 'package:movie_ticket_app/screens/Showtimes/component/cinema_index.dart';
import 'package:movie_ticket_app/screens/Showtimes/component/showtimes_appbar.dart';


class ShowtimesScreen extends StatefulWidget {
  @override
  _ShowtimesScreenState createState() => _ShowtimesScreenState();
}

class _ShowtimesScreenState extends State<ShowtimesScreen> {
//  bool press = false;
  int _seconds = 1;

  String _cinemaFilter = "";

  List<bool>_hasBeenPressed =[
    false,false,false
  ];
  List<CinemaIndex> _cinemaIndex = <CinemaIndex>[
    CinemaIndex("BHD Star The Garden","tang 4, 5 ..dsdd...HN","../images/image.jpg","HN"),
    CinemaIndex("BHD Stardasdasd The Garden","tang 4, 5 ..sadasdasd...HCM","../images/image.jpg","HCM"),
    CinemaIndex("BHD Star The Garden","tang 4, 5 .....Hue","../images/image.jpg","Hue"),
    CinemaIndex("BHD Star The Garden","tang 4, 5 .....HN","../images/image.jpg","HN"),
    CinemaIndex("BHD Star The Garden","tang 4, 5 .....HCM","../images/image.jpg","HCM"),
    CinemaIndex("BHD Star The Garden","tang 4, 5 .....Hue","../images/image.jpg","Hue"),
    CinemaIndex("BHD Star The Garden","tang 4, 5 .....HN","../images/image.jpg","HN"),
    CinemaIndex("BHD Star The Garden","tang 4, 5 .....HCM","../images/image.jpg","HCM"),
    CinemaIndex("BHD Star The Garden","tang 4, 5 .....Hue","../images/image.jpg","Hue"),

  ];
  /*final List<Map<String, dynamic>> _genders = [
    {
      'value': 'All',
      'label': 'All',

    },
    {
      'value': 'Atmos',
      'label': 'Atmos',

    },
    {
      'value': 'First Class',
      'label': 'First Class',
    },
    {
      'value': 'Deluxe',
      'label': 'Deluxe',
    },
    {
      'value': 'Kids',
      'label': 'Kids',
    },
    {
      'value': 'Onyx',
      'label': 'Onyx',
    },
  ];*/
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return new MyInheritedWidget(
      secondsToDisplay: _seconds,
      child: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: "Menu",
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
                      child: Text("Booking by Theater",
                        style: TextStyle(fontSize: 24,color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    )
                ),
                /*Container(
              child: Row(
                children:[
                  Text("Screen"),
                  RoundedSelectField(
                    hintText: "5 types",
                    items: _genders,
                  ),
                ],
              )
            ),*/
                Container(

                    child: Row(

                      children: [

                        SquareButton(
                          text: "Ho Chi Minh",
                          color: _hasBeenPressed[0] ? Colors.lightGreen : Colors
                              .black,
                          press: () =>
                          {
                            setState(() {
                              for(var i=0;i<_hasBeenPressed.length;i++){
                                _hasBeenPressed[i]=false;

                              }

                              _hasBeenPressed[0] = true;
                              print(_hasBeenPressed.toString());

                              _addPressed("HCM");
                            })


                          },


                          width: size.width * 0.3,
                        ),
                        SquareButton(
                          text: "Ha Noi",
                          color: _hasBeenPressed[1] ? Colors.lightGreen : Colors
                              .black,
                          press: () =>
                          {
                            setState(() {
                              for(var i=0;i<_hasBeenPressed.length;i++){
                                _hasBeenPressed[i]=false;

                              }

                              _hasBeenPressed[1] = true;
                              print(_hasBeenPressed.toString());
                              _addPressed("HN");
                            })


                          },
                          width: size.width * 0.3,
                        ),
                        SquareButton(
                          text: "Hue",
                          color: _hasBeenPressed[2] ? Colors.lightGreen : Colors
                              .black,
                          press: () =>
                          {
                            setState(() {
                              for(var i=0;i<_hasBeenPressed.length;i++){
                                _hasBeenPressed[i]=false;
                              }
                              _hasBeenPressed[2] = true;
                              print(_hasBeenPressed.toString());
                              _addPressed("Hue");
                            })


                          },
                          width: size.width * 0.25,
                        ),
                      ],
                    )
                ),

                Container(

                    height: size.height * 0.7,
                    child: SingleChildScrollView(

                        child:
                          MyList(_cinemaIndex,_cinemaFilter)
                    )
                )
              ]
          ),
        ),
        drawer: _buildDrawer(),
        //  bottomNavigationBar: BottomNavBar(2),
      )
    );
    }

  void _addPressed(String filter) {
    setState(() {
      _cinemaFilter = filter;
    });
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



// ignore: must_be_immutable
class MyList extends StatelessWidget {
  List<CinemaIndex> _cinemaIndex;
  String cinemaCityFilter;


  MyList(this._cinemaIndex,this.cinemaCityFilter);


  @override
  Widget build(BuildContext context) {


    final MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);
    return Column(

        children:
        List.generate(_cinemaIndex.length, (index) {
          if(_cinemaIndex[index].cinemaCity.contains(cinemaCityFilter) ) {

            return Center(
              // ignore: missing_return
              child: _cinemaIndex[index],
            );
          }
          else return Container();

          }
        )
    );
  }
}

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);
    return Text(inheritedWidget.secondsToDisplay.toString(),
      textScaleFactor: 5.0,
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






