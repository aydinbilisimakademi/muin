import 'package:flutter/material.dart';
import 'package:muin/widgets/widget_form_giris.dart';
import 'package:muin/widgets/widget_logo.dart';


class PageLogin extends StatefulWidget {

  const PageLogin({Key key}) : super(key : key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //altta klavye acildiginda patlamamasi icin
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(height: 50,),
              WidgetLogoMuin(),
              WidgetFormGiris()
            ],
          ),
        ],
      )
    );
  }
}
