import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/text_field_container.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RoundedCheckbox extends StatelessWidget {
  final String text;
  //final IconData icon;
  bool checkbox;
  // final  txt = TextEditingController();

  RoundedCheckbox({
    Key key,
    this.text,
    this.checkbox,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(

      title: Text("Tôi đã đọc, hiểu và đồng ý với các điều khoản"),
      value: checkbox,
      onChanged: (newValue) {

        print(newValue);
        /*  setState(() {
          checkbox = newValue;
        });*/

      },
      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
    );
  }
}