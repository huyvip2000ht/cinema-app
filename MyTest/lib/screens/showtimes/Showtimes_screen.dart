import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:movie_ticket_app/screens/showtimes/component/cinema_index.dart';
import 'package:movie_ticket_app/screens/Showtimes/component/showtimes_appbar.dart';
import 'package:movie_ticket_app/firebase/getCinemas.dart';

import 'component/test.dart';

class ShowtimesScreen extends StatefulWidget {
  @override
  _ShowtimesScreenState createState() => _ShowtimesScreenState();
}

class _ShowtimesScreenState extends State<ShowtimesScreen> {
  CollectionReference cinemas = FirebaseFirestore.instance.collection('cinemas');
//  bool press = false;
  int _seconds = 1;

  double _fakeLocationX = 105.810697;
  double _fakeLocationY = 21.023506;

  String _cinemaFilter = "";

  List<bool>_hasBeenPressed =[
    false,false,false
  ];
  List<CinemaIndex> _cinemaIndex = <CinemaIndex>[
    CinemaIndex("BHD Star The Garden",
        "Tầng 4 & 5,TTTM The Garden, khu đô thị The Manor,đường Mễ trì, phường Mỹ Đình 1, quận Nam Từ Liêm,Hà Nội"
        ,"assets/image/image.jpg"
        ,"HN",105.776147, 21.013668),
    CinemaIndex("BHD Star Discovery"
        ,"Tầng 8,TTTM Discovery - 302 Cầu Giấy, Hà Nội"
        ,"assets/image/image.jpg"
        ,"HN",105.794171, 21.035412),
    CinemaIndex("BHD Star Phạm Ngọc Thạch",
        "Tầng 8 TTTM Vincom, số 2 Phạm Ngọc Thạch, Đống Đa, Hà Nội"
        ,"assets/image/image.jpg"
        ,"HN",105.831817, 21.006267),
    CinemaIndex("BHD Star Quang Trung",
        "Tầng B1&B2, TTTM Vincom, số 190 Quang Trung, Gò Vấp, Tp.HCM",
        "assets/image/image.jpg"
        ,"HCM",106.672095, 10.829458),
    CinemaIndex("BHD Star Phạm Hùng"
        ,"Lầu 4, TTTM Satra Phạm Hùng,C6/27 Phạm Hùng, Bình Chánh,Tp.HCM"
        ,"../images/image.jpg"
        ,"HCM",106.674722, 10.733611),
    CinemaIndex("BHD Star 3.2"
        ,"Lầu 5,Siêu thị Vincom 3/2,3C Đường 3/2,Quận 10, TPHCM"
        ,"../images/image.jpg"
        ,"HCM",106.680707, 10.776112),
    CinemaIndex("BHD Star Bitexco"
        ,"Lầu 3 & 4, TTTM ICON 68, 2 Hải Triều, Quận 1, TPHCM "
        ,"../images/image.jpg"
        ,"HCM",106.704522, 10.771743),
    CinemaIndex("BHD Star Huế"
        ,"Vincom Huế, 50A Hùng Vương tổ 10, Phú Nhuận, Thành phố Huế, Thừa Thiên Huế"
        ,"../images/image.jpg"
        ,"Hue",107.594586, 16.463207),
  ];
 // List<CinemaIndex> _cinemaIndex=[];

/*  Future<String> submitAll() async{
    FirebaseFirestore.instance.collection("cinemas").get().then(
          (value) {
        value.docs.forEach(
              (element) {
            print(element.data());
            print(element.data()["cinemaX"]);
            CinemaIndex a = new CinemaIndex(element.data()["cinemaName"], element.data()["cinemaAddress"], element.data()["cinemaImage"], element.data()["cinemaCity"], element.data()["cinemaX"], element.data()["cinemaY"]);
            _cinemaIndex.add(a);
            print("da them");
            return 'success';
          },
        );
      },
    );
  }*/
/*  void yourFunction() async{
    await submitAll();
    print("Loaded");
    print(_cinemaIndex.length);
  }*/








  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
   // yourFunction();
  /*  FirebaseFirestore.instance
        .collection('cinemas')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {

        _cinemaIndex.add(new CinemaIndex(doc["cinemaName"], doc["cinemaAddress"],
            doc["cinemaImage"], doc["cinemaCity"],doc["cinemaX"].toDouble(),doc["cinemaY"].toDouble()));
        print("con cac");
        print(doc["cinemaX"]);
      });
    });*/

/*    FirebaseFirestore.instance.collection("cinemas").get().then(
          (value) {
        value.docs.forEach(
              (element) {
            print(element.data());
            print(element.data()["cinemaX"]);
            _cinemaIndex.add(new CinemaIndex(element.data()["cinemaName"], element.data()["cinemaAddress"], element.data()["cinemaImage"], element.data()["cinemaCity"], element.data()["cinemaX"], element.data()["cinemaY"]));
          },
        );
      },
    );*/



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
                    height: size.height * 0.65,
                    child: SingleChildScrollView(
                        child:
                          MyList(_cinemaIndex,_cinemaFilter)
                            //UserInformation(),
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
class MyList extends StatefulWidget {
  // List<CinemaIndex> _cinemaIndex = getCinema().getAllCinemas();
  String cinemaCityFilter;
  List<CinemaIndex> _cinemaIndex; //getCinema().getAllCinemas() ;

  MyList(this._cinemaIndex, this.cinemaCityFilter);

  @override
  _MyListState createState() => _MyListState();
}
class _MyListState extends State<MyList>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    final MyInheritedWidget inheritedWidget = MyInheritedWidget.of(context);

    /*if(widget._cinemaIndex.isEmpty){
      setState(){
          widget._cinemaIndex;
      };
      return Container(
        child: Column(
          children:[Text("loading...",style: TextStyle(
            color: Colors.white,
          ),),
        ]
        )
      );
    }*/


    return Container(
     // height: size.width*0.3,
      child:Column(

        children:
        List.generate(widget._cinemaIndex.length, (index) {
          if(widget._cinemaIndex[index].cinemaCity.contains(widget.cinemaCityFilter) ) {
          //  print("hehe" + _cinemaIndex[index].cinemaName);
            return Center(

              // ignore: missing_return
              child: Container(
                //height: size.height*0.3,
                child:widget._cinemaIndex[index],
              )
            );
          }
          else return Container();

          }
        )
    ));
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





