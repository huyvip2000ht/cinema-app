import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/text_field_container.dart';
import 'package:movie_ticket_app/constants.dart';
import 'package:select_form_field/select_form_field.dart';

class RoundedSelectField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final List<Map<String, dynamic>> items;



  const RoundedSelectField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
    TextEditingController _controller;

    return TextFieldContainer(
      child: SelectFormField(
        //type: SelectFormFieldType.dialog,
        controller: _controller,
        //initialValue: _initialValue,
        //icon: Icon(Icons.format_shapes),
        labelText: hintText,
        changeIcon: true,
        dialogTitle: 'Pick a item',
        dialogCancelBtn: 'CANCEL',
        enableSearch: true,
        dialogSearchHint: 'Search item',
        items: items,


        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        /*onChanged: (val) => setState(() => _valueChanged = val),
              validator: (val) {
                setState(() => _valueToValidate = val ?? '');
                return null;
              },
              onSaved: (val) => setState(() => _valueSaved = val ?? ''),*/
      ),
    );
  }
}