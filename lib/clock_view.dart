import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class ClockView extends StatefulWidget {


  @override

  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {

    Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {

      });
    });
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Row(
      children: <Widget>[
        Container(

          width:MediaQuery.of(context).size.height/3,// (MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/4)/1.3,
          height: MediaQuery.of(context).size.height/3,//(MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/4)/1.3,

          child: Transform.rotate(
            angle: -pi/2,
            child: CustomPaint(
              painter: ClockPainter(),
            ),
          ),
        ),
      ],
    );
  }
}

class ClockPainter extends CustomPainter
{
  var dateTime=DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
var centerX=size.width/2;
var centerY=size.height/2;
var center =Offset(centerX,centerY);
var radius=min(centerX,centerY);

var fillBrush =Paint()
..color=Color(0xFF444974);


var outlineBrush =Paint()
..color=Color(0xFFEAECFF)
..style=PaintingStyle.stroke
..strokeWidth=size.width/20;


var centerFillBrush =Paint()
..color=Color(0xFFEAECFF)
;

var secHandBrush =Paint()
  ..color=Colors.orange[300]
  ..strokeCap=StrokeCap.round
  ..style=PaintingStyle.stroke
  ..strokeWidth=size.width/60;

var minHandBrush =Paint()
..shader=RadialGradient(colors: [Color(0xFF748EF6),Color(0xFF77D0FF)]).createShader(Rect.fromCircle(center: center,radius: radius))
  ..strokeCap=StrokeCap.round
  ..style=PaintingStyle.stroke
  ..strokeWidth=size.width/30;

var hoursHandBrush =Paint()
  ..shader=RadialGradient(colors: [Color(0xFFEA74AB),Color(0xFFC279FB)]).createShader(Rect.fromCircle(center: center,radius: radius))
  ..strokeCap=StrokeCap.round
  ..style=PaintingStyle.stroke
  ..strokeWidth=size.width/24;
var dashBrush=Paint()
..color=Colors.white70
..strokeWidth=0.8
;
canvas.drawCircle(center, radius*0.75, fillBrush);
canvas.drawCircle(center, radius*0.75, outlineBrush);

var minHandX=centerX+radius*0.6*cos(dateTime.minute*6*pi/180);
var minHandY=centerX+radius*0.6*sin(dateTime.minute*6*pi/180);
canvas.drawLine(center, Offset(minHandX,minHandY), minHandBrush);


var hourHandX=centerX+radius*0.4*cos((dateTime.hour*30+dateTime.minute*0.5)*pi/180);
var hourHandY=centerX+radius*0.4*sin((dateTime.hour*30+dateTime.minute*0.5)*pi/180);
canvas.drawLine(center, Offset(hourHandX,hourHandY), hoursHandBrush);


var secHandX=centerX+radius*0.6*cos(dateTime.second*6*pi/180);
var secHandY=centerX+radius*0.6*sin(dateTime.second*6*pi/180);
canvas.drawLine(center, Offset(secHandX,secHandY), secHandBrush);

canvas.drawCircle(center, radius*0.12, centerFillBrush);


var outerCircleRaduis = radius;
var innerCircleRaduis =radius*0.9;
for(double i=0;i<360;i+=12)
  {
    var x1 =centerX+outerCircleRaduis*cos(i*pi/180);
    var y1 =centerX+outerCircleRaduis*sin(i*pi/180);

    var x2 =centerX+innerCircleRaduis*cos(i*pi/180);
    var y2=centerX+innerCircleRaduis*sin(i*pi/180);

    canvas.drawLine(Offset(x1,y1), Offset(x2,y2), dashBrush);
  }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}