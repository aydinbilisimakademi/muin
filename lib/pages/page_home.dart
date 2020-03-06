import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:muin/widgets/widget_ana_butonlar.dart';
import 'package:muin/widgets/widget_circle_avatar.dart';
import 'package:provider/provider.dart';


class PageHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 27, 23, 43),
          color: Color.fromARGB(255, 236, 186, 39),
          items: <Widget>[
            Icon(Icons.power_settings_new, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.settings, size: 30),
            Icon(Icons.message, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        body: Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 60),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.2
                  ],
                  colors: [
                    Colors.white70,
                    Colors.white,
                  ]),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WidgetCircleAvatar(),
              WidgetAnaButonlar()
            ],
          ),
        ),
    );
  }
}

/*
* Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 27, 23, 43),
        ),
        child: Stack(
          children: <Widget>[
            //Positioned(child: WidgetBottomBar()),
            Positioned(top: 60, child: WidgetAnasayfaArka()),
            Positioned(top: 100, child: WidgetCircleAvatar()),
            Positioned(top: 280, child: WidgetAnaButonlar()),

          ],
        ),
      ),
* */
