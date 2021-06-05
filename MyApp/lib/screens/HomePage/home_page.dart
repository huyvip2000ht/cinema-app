import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:movie_ticket_app/main.dart';
import 'package:movie_ticket_app/screens/HomePage/components/background_list_view.dart';
import 'package:movie_ticket_app/screens/HomePage/components/custom_appbar.dart';
import 'package:movie_ticket_app/screens/HomePage/components/movie_list_view.dart';
import 'package:movie_ticket_app/screens/Profile/profile_screen.dart';
import 'package:movie_ticket_app/screens/showtimes/showtimes.dart';
import 'package:movie_ticket_app/screens/store/store.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // connecting Background list and Movie list
    movieScrollController.addListener(() {
      backgroundScrollController
          .jumpTo(movieScrollController.offset * (size.width / movieItemWidth));
    });

    return Scaffold(
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background of home screen
          BackgroundListView(backgroundScrollController),

          //Movie detail List view
          MovieListView(movieScrollController, movieItemWidth)
        ],
      ),
      drawer: _buildDrawer(),
      // bottomNavigationBar: BottomNavBar(),
    );
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
                        image: AssetImage(
                            "assets/images/movie-ticket-booking.png"),
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
                              'Movies Ticket Booking',
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
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              leading: Icon(Icons.movie_creation, color: Colors.white),
              title: Text(
                'Showtimes',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Showtimes()));
              },
            ),
            Divider(color: Colors.white54),
            ListTile(
              leading: Icon(Icons.store, color: Colors.white),
              title: Text(
                'Store',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Store()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_input_svideo_rounded,
                  color: Colors.white),
              title: Text(
                'Promotions',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contact_phone, color: Colors.white),
              title: Text(
                'Account Information',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
