import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/text_field_container.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RoundedDateField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onPressed;

  TextEditingController controller = new TextEditingController();

  RoundedDateField({
    Key key,
    this.hintText,
    this.icon = Icons.calendar_today_rounded,
    this.onChanged,
    this.onPressed,
    this.controller

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        readOnly: true,
        onTap: (){
          DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1900,1,1),
              maxTime: DateTime(2030,1,1), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                controller.text = date.day.toString()+"/"+date.month.toString()+"/"+date.year.toString();
              }, currentTime: DateTime.now(), locale: LocaleType.vi);
        } ,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}