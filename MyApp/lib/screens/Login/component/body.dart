import 'package:flutter/material.dart';
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
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),

            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email or Username",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
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