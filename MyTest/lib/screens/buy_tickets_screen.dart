import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screens/Profile/components/body.dart';
import 'package:movie_ticket_app/screens/body_buytickets.dart';

class BuyTicketsScreen extends StatefulWidget{
  _BuyTicketsScreen createState()=> _BuyTicketsScreen();
}
class _BuyTicketsScreen extends State<BuyTicketsScreen>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: new Stack(
       alignment: Alignment.center,
       children: [
         new BodyBuyTickets(),

       ],
     ),

   );
  }

}