import 'package:flutter/material.dart';
import 'package:muin/widgets/widget_game_color_number_box.dart';
import 'package:muin/entities/entity_games_colors_numbers.dart';
import 'package:muin/CoreUtils/routing_constants.dart';
import 'dart:async';

class PageGameColorsNumbers extends StatefulWidget {
  @override
  _PageGameColorsNumbersState createState() => _PageGameColorsNumbersState();
}

class _PageGameColorsNumbersState extends State<PageGameColorsNumbers> {
  EntityColorNumber question;
  EntityMenagerColorsNumbers menager;
  int score;
  Timer _timer;
  int seconds;

  @override
  void initState() {
    this.score = 0;
    this.menager = EntityMenagerColorsNumbers();
    this.menager.generate();
    this.question = this.menager.askQuestion();
    var now = DateTime.now();
    var twoHours = now.add(Duration(minutes: 2)).difference(now); //2 dakika
    seconds = twoHours.inSeconds;
    startTimer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Number"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this.question.getNumberStringRepresent(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      this.question.getColorStringRepresent(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    ),
                  ],
                ),
                Divider(),
                Text("Score: ${this.score}"),
                Text("Time left : ${constructTime(seconds)}"),
                Divider(),
                GridView.count(
                  crossAxisCount: 6,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(
                      this.menager.entitycolorsnumbers.length, (index) {
                    return Center(
                      child: Box(
                        cn: this.menager.entitycolorsnumbers[index],
                        check: this.check,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void check(EntityColorNumber ecn) {
    if (this.question == null) {
      Navigator.of(context).pushNamed(PageRouteResult, arguments: (this.score*100) / 48);
    } else {
      if (ecn.getNumberIntRepresent() == this.question.getNumberIntRepresent() && ecn.getColorStringRepresent() == this.question.getColorStringRepresent()) {
        ecn.color = Colors.black;
        this.score++;
        this.question = this.menager.askQuestion();
        if (this.question == null) {
          Navigator.of(context).pushNamed(PageRouteResult, arguments: (this.score*100) / 48);
        }
        if(this.question != null){setState(() {});}
      }
      else{
        this.score--;
        setState(() {});
      }
    }
  }


  //zaman fonksiyonlari
  String constructTime(int seconds) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return formatTime(hour) + ":" + formatTime(minute) + ":" + formatTime(second);
  }

  // Digital formatting, converting 0-9 time to 00-09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }


  void startTimer() {
    // Set 1 second callback
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      // Update interface
      setState(() {
        // minus one second because it calls back once a second
        seconds--;
      });
      if (seconds == 0) {
        // Countdown seconds 0, cancel timer
        cancelTimer();
        Navigator.of(context).pushNamed(PageRouteResult, arguments: (this.score*100) / 48);
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}
