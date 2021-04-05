import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:clock/clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetsign = '';
    var widthh;
    if (!timezoneString.startsWith('-')) offsetsign = '+';

    return Scaffold(
      backgroundColor: Color(0xFF202f41),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flat_button(name: 'Clock',url: 'https://raw.githubusercontent.com/afzalali15/flutter_alarm_clock/master/assets/clock_icon.png',),
                  Flat_button(name: 'Alarm',url: 'https://raw.githubusercontent.com/afzalali15/flutter_alarm_clock/master/assets/alarm_icon.png',),
                  Flat_button(name: 'Stopwatch',url: 'https://raw.githubusercontent.com/afzalali15/flutter_alarm_clock/master/assets/stopwatch_icon.png',),
                  Flat_button(name: 'Timer',url: 'https://raw.githubusercontent.com/afzalali15/flutter_alarm_clock/master/assets/timer_icon.png',),
                ],
              ),
            ),
            VerticalDivider(color: Colors.white54,width: 1,),
            Expanded(
               flex: 3,
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
                //color: Color(0xFF202f41),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        'Clock',
                        style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 24),
                      ),
                    ),

                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            formattedTime,
                            style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 64),
                          ),
                          Text(
                            formattedDate,
                            style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Flexible(flex: 4,
                        fit: FlexFit.tight,
                        child: Align(alignment: Alignment.center,
                            child: ClockView(),
                        ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 25,),
                          Text(
                            'Timezone',
                            style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 24),
                          ),

                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'UTC' + offsetsign + timezoneString,
                                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Flat_button extends StatelessWidget {
  Flat_button({ this.name, this.url});
final String name;
final String url;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 0),
      color: name=='Clock'?Colors.redAccent:Colors.transparent,
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Image.network(url,scale: 1.2,),
          SizedBox(height: 16,),
          Text(name,
          style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight:FontWeight.bold,color: Colors.grey),
          ),//TextStyle(fontFamily:GoogleFonts.lato(),fontSize: 14,color: Colors.white),)
        ],
      ),
    );
  }
}
//https://raw.githubusercontent.com/afzalali15/flutter_alarm_clock/master/assets/clock_icon.png