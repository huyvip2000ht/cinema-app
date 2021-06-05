import 'package:movie_ticket_app/screens/HomePage/home_page.dart';
import 'package:movie_ticket_app/screens/login.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  Login.routeName: (context) => Login()
};
