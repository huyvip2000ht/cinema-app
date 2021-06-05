import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/rounded_button.dart';
import 'package:movie_ticket_app/components/rounded_date_field.dart';
import 'package:movie_ticket_app/components/rounded_input_field.dart';
import 'package:movie_ticket_app/components/rounded_select_field.dart';
import 'package:movie_ticket_app/screens/Login/component/background.dart';

class BodyBuyTickets extends StatefulWidget{
  _BodyBuyTickets createState()=> _BodyBuyTickets();

}

class _BodyBuyTickets extends State<BodyBuyTickets>{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
    TextEditingController _controller;

    final List<Map<String, dynamic>> _branchs = [
      {
        'value': 'so 1 pham hung',
        'label': 'Số 1 Phạm Hùng',
      },
      {
        'value': 'so 144 xuan thuy',
        'label': 'Số 144 Xuân Thủy'
      },
      {
        'value': 'so 1 ho tung mau',
        'label': 'Số 1 Hồ Tùng Mậu'
      }
    ];

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage('assets/image/joker.jpeg'),
                        fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*0.03),
            Text(
              "Tiêu đề phim:",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
             "Tóm tắt phim:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ngày công chiếu:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Diễn viên:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),

            Text(
              "Mời chọn thời gian và địa điểm xem phim",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedSelectField(
              hintText: "Chọn địa điểm",
              items: _branchs,

            ),

            RoundedDateField(
              hintText: "Chọn Thời gian",
            ),
            RoundedInputField(
              hintText: "Ghi chú thêm",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Xác Nhận",
              press: (){},
            ),
            Container(height: 120.0),
          ],
        ),
      )
    );

  }


}