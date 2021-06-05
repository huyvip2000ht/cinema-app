import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/bottomNavbar.dart';
import 'package:movie_ticket_app/routes.dart';
import 'package:movie_ticket_app/screens/Detail/detail_screen.dart';
import 'package:movie_ticket_app/screens/HomePage/home_page.dart';
import 'package:movie_ticket_app/screens/Login/login_screen.dart';
import 'package:movie_ticket_app/screens/buy_tickets_screen.dart';
import 'package:provider/provider.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapsort) {
          return MaterialApp(
            title: "Cinemas in Vietnam",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.blue,
            ),
            home: BottomNavBar(0),
            // initialRoute: '/welcome',
            // routes: routes,
          );
        });
  }
}
