import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/bottomNavbar.dart';
import 'package:movie_ticket_app/firebase/getCinemas.dart';
import 'package:movie_ticket_app/full_map.dart';
import 'package:movie_ticket_app/routes.dart';
import 'package:movie_ticket_app/screens/CinemaDetail/component/simpleDirection.dart';
import 'package:movie_ticket_app/screens/Detail/detail_screen.dart';
import 'package:movie_ticket_app/screens/HomePage/home_page.dart';
import 'package:movie_ticket_app/screens/Login/login_screen.dart';
import 'package:movie_ticket_app/screens/Payment/payment_screen.dart';
import 'package:movie_ticket_app/screens/buy_tickets_screen.dart';
import 'package:movie_ticket_app/screens/showtimes/component/test.dart';
import 'package:provider/provider.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wemapgl/wemapgl.dart' ;
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:wemapgl/wemapgl.dart' as WEMAP;
//import 'package:movie_ticket_app/full_map.dart';



void main() async {
  WEMAP.Configuration.setWeMapKey('GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ');

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  //runApp(PaymentScreen());
 // runApp(MaterialApp(home: SimpleDirectionPage()));

 // runApp(App());
}


/*

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
         // return SomethingWentWrong();
          print("loi");
          return MaterialApp(title: "ok",);

        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print("ok");
          return MaterialApp(title: "ok",);
        }

        // Otherwise, show something whilst waiting for initialization to complete
       // return Loading();
        print("khac");

        return MaterialApp(title: "ok",);

      },
    );
  }
}

*/




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
