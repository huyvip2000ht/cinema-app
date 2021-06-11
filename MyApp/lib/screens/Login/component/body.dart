import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/firebase/auth.dart';
import 'package:movie_ticket_app/main.dart';
import 'package:movie_ticket_app/screens/Login/component/background.dart';
//import 'package:movie_ticket_app/Screens/Signup/signup_screen.dart';
import 'package:movie_ticket_app/components/already_have_an_account_acheck.dart';
import 'package:movie_ticket_app/components/rounded_button.dart';
import 'package:movie_ticket_app/components/rounded_input_field.dart';
import 'package:movie_ticket_app/components/round_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_ticket_app/screens/Signup/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),

            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              inputController: _emailController,
              hintText: "Email or Username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              passwordController: _passwordController,
              hintText: "Password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                var authHandler = new Auth();
                authHandler.handleSignInEmail(_emailController.text, _passwordController.text)
                    .then((User user) {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new MyApp()));
                }).catchError((e) => print(e));
              }

            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: ()  {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}