import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:movie_ticket_app/Screens/Signup/components/background.dart';
import 'package:movie_ticket_app/components/rounded_button.dart';

import 'package:movie_ticket_app/components/rounded_date_field.dart';
import 'package:movie_ticket_app/components/rounded_input_field.dart';
import 'package:movie_ticket_app/components/round_password_field.dart';

import 'package:movie_ticket_app/components/rounded_select_field.dart';
import 'package:movie_ticket_app/firebase/addUser.dart';
import 'package:movie_ticket_app/firebase/auth.dart';

import '../../../main.dart';




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
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _birthController = TextEditingController();
    TextEditingController _genderController = TextEditingController();
    TextEditingController _cityController = TextEditingController();
    TextEditingController _addressController = TextEditingController();

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
              inputController: _emailController,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              passwordController: _passwordController,
              onChanged: (value) {},
            ),
            /*RoundedPasswordField(
              hintText: "Confirm Password",

              onChanged: (value) {},
            ),*/
            RoundedInputField(
              hintText: "Name",
              inputController: _nameController,
              onChanged: (value) {},
            ),
            /*RoundedInputField(
              hintText: "First Name",
              onChanged: (value) {},
            ),*/
            RoundedInputField(
              hintText: "Phone Number",
              inputController: _phoneController,
              onChanged: (value) {},
            ),

            RoundedDateField(
              controller: _birthController,
              hintText: "Date Of Birth",
            ),

            RoundedSelectField(
              controller: _genderController,
              hintText: "Gender",
              items: _genders,
            ),
            RoundedSelectField(
              controller: _cityController,
              hintText: "City / Province",
              items: _provinces,
            ),
            RoundedInputField(
              inputController: _addressController,
              hintText: "Address",
              onChanged: (value) {},
            ),
           // Container(height: 120.0),
            RoundedButton(
                text: "REGISTER",
                press: () async {
                  var authHandler = new Auth();
                  var _addUser = new AddUser(_emailController.text, _nameController.text,
                      _phoneController.text, _birthController.text,
                      _genderController.text, _cityController.text, _addressController.text);


                  authHandler.handleSignUp(_emailController.text, _passwordController.text)
                      .then((User user) {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp()));
                  }).catchError((e) => print(e));
                  /*try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,

                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }*/
                }

            ),

            //  SizedBox(height: size.height * 0.03),



          ],
        ),
      ),
    );
  }
}