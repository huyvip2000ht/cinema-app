import 'package:flutter/material.dart';

import 'package:movie_ticket_app/Screens/Signup/components/background.dart';

import 'package:movie_ticket_app/components/rounded_date_field.dart';
import 'package:movie_ticket_app/components/rounded_input_field.dart';
import 'package:movie_ticket_app/components/round_password_field.dart';

import 'package:movie_ticket_app/components/rounded_select_field.dart';




/*
Future<void> _getValue() async {
  await Future.delayed(const Duration(seconds: 3), () {
    setState(() {
      //_initialValue = 'circleValue';
      _controller?.text = 'circleValue';
    });
  });
}
*/

class Body extends StatefulWidget{
  _Body createState()=> _Body();
}


class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
    TextEditingController _controller;
    //String _initialValue;


    final List<Map<String, dynamic>> _genders = [
      {
        'value': 'male',
        'label': 'Male',

      },
      {
        'value': 'female',
        'label': 'Female',

      },
    ];
    final List<Map<String, dynamic>> _provinces = [
      {
        'value': 'Ha Noi',
        'label': 'Hà Nội',
        //'icon': Icon(Icons.stop),
      },
      {
        'value': 'HCM',
        'label': 'Thành phố Hồ Chí Minh',        //'icon': Icon(Icons.fiber_manual_record),
        // 'textStyle': TextStyle(color: Colors.red),
      },
      {
        'value': 'Hue',
        'label': 'Huế',
        //'icon': Icon(Icons.fiber_manual_record),
        // 'textStyle': TextStyle(color: Colors.red),
      },
    ];





    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),

            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",

              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Confirm Password",

              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Last Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "First Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Mobile",
              onChanged: (value) {},
            ),

            RoundedDateField(
              hintText: "Date Of Birth",
            ),

            RoundedSelectField(
              hintText: "Gender",
              items: _genders,
            ),
            RoundedSelectField(
              hintText: "City / Province",
              items: _provinces,
            ),
            RoundedInputField(
              hintText: "Address",
              onChanged: (value) {},
            ),
            Container(height: 120.0),

            //  SizedBox(height: size.height * 0.03),



          ],
        ),
      ),
    );
  }
}