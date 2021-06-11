import 'package:flutter/material.dart';

import 'package:movie_ticket_app/enum.dart';

import '../../constants.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
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
      body: Body(),
      drawer: _buildDrawer(),
    );
    //return Body();
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
