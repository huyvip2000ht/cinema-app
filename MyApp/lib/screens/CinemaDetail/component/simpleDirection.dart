import 'package:flutter/material.dart';
import 'package:wemapgl/wemapgl.dart';

import 'package:movie_ticket_app/ePage.dart';

class SimpleDirectionPage extends EPage {
  double _fakeX;
  double _fakeY;
  double _cinemaX;
  double _cinemaY;


  SimpleDirectionPage(this._fakeX,this._fakeY,this._cinemaX,this._cinemaY) : super(const Icon(Icons.directions), 'Simple Multiple Direction');

  @override
  Widget build(BuildContext context) {
    return DirectionAPI(this._fakeX,this._fakeY,this._cinemaX,this._cinemaY);
  }
}

class DistanceTimeEstimate extends StatefulWidget{
  double _distance;
  double _fakeX;
  double _fakeY;
  double _cinemaX;
  double _cinemaY;

  DistanceTimeEstimate(this._distance,this._fakeX,this._fakeY,this._cinemaX,this._cinemaY);

  @override
  State createState() => DistanceTimeEstimateState();


}
class DistanceTimeEstimateState extends State<DistanceTimeEstimate>{
  WeMapDirections directionAPI = WeMapDirections();

  double _tripDistance = 0;
  int _tripTime = 0;
  String text = "";

  @override
  Widget build(BuildContext context) {




    if(widget._distance <= 0){
      onStyleLoadedCallback();
    }



    return
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Text(text,
            style: TextStyle(fontSize: 16,color: Colors.white),
            textAlign: TextAlign.left,
            )


        )
    );



    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 12.0),
              child: Text("Trip distance: $_tripDistance m. Trip time estimate: $_tripTime ms",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),

          ],
        ));
  }


  @override
  void dispose() {
    super.dispose();
  }

  void onStyleLoadedCallback() async {
    List<LatLng> points = [];


    points.add(LatLng(widget._fakeY, widget._fakeX)); //origin Point
    // points.add(LatLng(21.024412, 105.798115)); //way Point
    points.add(LatLng(widget._cinemaY, widget._cinemaX)); //destination Point

    final json = await directionAPI.getResponseMultiRoute(
        0, points); //0 = car, 1 = bike, 2 = foot
    List<LatLng> _route = directionAPI.getRoute(json);
    List<LatLng> _waypoins = directionAPI.getWayPoints(json);

    setState(() {
      _tripDistance = directionAPI.getDistance(json).toDouble() ;
      _tripTime = directionAPI.getTime(json) ;


        if(_tripDistance>=300000)
          text = "Cách bạn: Quá xa";
        else if(_tripDistance <=0){
          text= "Đang tính toán vị trí";
        }
        else if(_tripDistance<1000 && _tripTime <=3600){
          text = "Cách bạn: $_tripDistance m ~ 1 phút";
        }

        else if(_tripDistance >= 1000 && _tripTime>3600){
          _tripDistance = double.parse((_tripDistance /1000).toStringAsFixed(1));
          _tripTime = _tripTime~/60000*4;
          text= "Cách bạn: $_tripDistance km ~ $_tripTime phút";
        }





    }

    );
  }


}

class DirectionAPI extends StatefulWidget {

  double _fakeX;
  double _fakeY;
  double _cinemaX;
  double _cinemaY;

  DirectionAPI(this._fakeX,this._fakeY,this._cinemaX,this._cinemaY);

  @override
  State createState() => DirectionAPIState();
}

class DirectionAPIState extends State<DirectionAPI> {
  WeMapDirections directionAPI = WeMapDirections();

  int _tripDistance = 0;
  int _tripTime = 0;

   WeMapController mapController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;


    if((widget._fakeX-widget._cinemaX).abs()>3 ||(widget._fakeY-widget._cinemaY).abs()>3){
      return Container(
       // color: Colors.red,

          child: SizedBox(

            height: size.height *0.5,
              child:Center(
                  child: Text("Quá xa để hiển thị bản đồ!!!",
                      style: TextStyle(fontSize: 24,color: Colors.white),
                      textAlign: TextAlign.left)
              )

          )


      );
    }
    return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 350.0,
                    height: 300.0,
                    child: WeMap(
                      onMapCreated: _onMapCreated,
                      onStyleLoadedCallback: onStyleLoadedCallback,
                      initialCameraPosition:  CameraPosition(
                        target: LatLng(((widget._fakeY+widget._cinemaY)/2),((widget._fakeX+widget._cinemaX)/2) ),
                        zoom: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }

  void _onMapCreated(WeMapController mapController) {
    this.mapController = mapController;
  }

  @override
  void dispose() {
    super.dispose();
  }
  void callDirection () async{

  }

  void onStyleLoadedCallback() async {
    List<LatLng> points = [];
    print(widget._fakeX);
    print(widget._fakeY);
    print(widget._cinemaX);
    print(widget._cinemaY);



    points.add(LatLng(widget._fakeY,widget._fakeX )); //origin Point
   // points.add(LatLng(21.024412, 105.798115)); //way Point
    points.add(LatLng(widget._cinemaY,widget._cinemaX )); //destination Point

    final json = await directionAPI.getResponseMultiRoute(0, points); //0 = car, 1 = bike, 2 = foot
    List<LatLng> _route = directionAPI.getRoute(json);
    List<LatLng> _waypoins = directionAPI.getWayPoints(json);

    setState(() {
      _tripDistance = directionAPI.getDistance(json);
      _tripTime = directionAPI.getTime(json);
    });


    await mapController.addLine(
      LineOptions(
        geometry: _route,
        lineColor: "#0071bc",
        lineWidth: 5.0,
        lineOpacity: 1,
      ),
    );
    await mapController.addCircle(
        CircleOptions(geometry: _waypoins[0], circleRadius: 8.0, circleColor: '#d3d3d3', circleStrokeWidth: 1.5, circleStrokeColor: '#0071bc'));
    for (int i = 1; i < _waypoins.length; i++) {
      await mapController.addCircle(
          CircleOptions(geometry: _waypoins[i], circleRadius: 8.0, circleColor: '#ffffff', circleStrokeWidth: 1.5, circleStrokeColor: '#0071bc'));
    }
  }
}
