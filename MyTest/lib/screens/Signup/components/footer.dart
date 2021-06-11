import 'package:flutter/material.dart';

import 'package:movie_ticket_app/components/rounded_button.dart';



class Footer extends StatefulWidget{
  Footer({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Footer createState()=> _Footer();
}


class _Footer extends State<Footer>{
  bool _checkboxListTile = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Container(
      height: 120.0,width: size.width , color: Colors.black12,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("Tôi đã đọc, hiểu và đồng ý với các điều khoản"),
              value: _checkboxListTile,
              onChanged: (value) {
                setState(() {
                  _checkboxListTile = !_checkboxListTile;
                });
              },
            ),

            RoundedButton(
              text: "Register",
              press: () {},
            ),

          ],
        ),
      ),
    );
  }


}