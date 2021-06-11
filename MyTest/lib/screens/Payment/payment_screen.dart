import 'package:flutter/material.dart';
import 'package:movie_ticket_app/constants/constants.dart';
import 'package:movie_ticket_app/models/movie_model.dart';
import 'package:movie_ticket_app/screens/Payment/components/background.dart';
import 'package:movie_ticket_app/screens/Payment/components/confirm_button.dart';
import 'package:movie_ticket_app/screens/Payment/components/detail_rubber_sheet.dart';
import 'package:rubber/rubber.dart';

class PaymentScreen extends StatefulWidget {

  final MovieModel movie;

  final Size size;


  PaymentScreen({this.movie, this.size});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {

  RubberAnimationController rubberAnimationSheetController;
  ScrollController rubberSheetScrollController;


  //animation when page starts
  @override
  void initState() {
    super.initState();
    rubberSheetScrollController = ScrollController();
    rubberAnimationSheetController = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: widget.size.height * 0.75),
        dismissable: false,
        upperBoundValue: AnimationControllerValue(percentage: 0.9),
        duration: Duration(milliseconds: 300),
        springDescription: SpringDescription.withDampingRatio(
          mass: 1,
          stiffness: Stiffness.LOW,
          ratio: DampingRatio.MEDIUM_BOUNCY,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Background movie image
          Background(background: widget.movie.image),

          //Buttom sheet
          DetailRubberSheet(widget.movie, rubberSheetScrollController, rubberAnimationSheetController,),

          //Buy button
          ConfirmButton(widget.movie.name),
        ],
      ),
    );
  }
}