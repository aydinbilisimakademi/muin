import 'package:flutter/material.dart';
import 'package:muin/widgets/widget_circular_percent_indicator.dart';
import 'package:muin/CoreUtils/routing_constants.dart';

class PageResult extends StatelessWidget {
  final double sonuc;
  const PageResult({Key key, this.sonuc}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Test Sonucu", style: TextStyle(fontSize: 30, color: Colors.black),),
              SizedBox(height: 30,),
              WidgetResult(key: key, deger: this.sonuc/100,),
              Divider(),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FlatButton(
                  child: Text("Ana Sayfa",style: TextStyle(decoration: TextDecoration.underline, fontSize: 30) ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, PageRouteHome);
                  },
                ),
              ),
            ],
          ),
        )
        //Center(child: Text(this.sonuc.toString(), style: TextStyle(color: Colors.white),),),
      ),
    );
  }
}
