import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/Signup/components/body.dart';
import 'package:movie_ticket_app/screens/Signup/components/footer.dart';
//import 'package:movie_ticket_app/components/footer_layout.dart';


class SignUpScreen extends StatefulWidget{
  _SignUpScreen createState()=> _SignUpScreen();
}


class _SignUpScreen extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    /* return Scaffold(
      body: Body(),
    );*/
    /*return Scaffold(
      body: new Stack(
        alignment: Alignment.bottomCenter,
        children: [
          new Body(),
          new Container(height: 40.0, color: Colors.red),
          new FooterScreen(),
        ],
      ),
    );*/
    return Scaffold(
      body: new Stack(
        alignment: Alignment.bottomCenter,
        children: [
          new Body(),
          //  new Container(height: 40.0, color: Colors.red),
          new Footer(),
        ],
      ),
    );
  }


}