import 'package:flutter/material.dart';
import 'package:muin/entities/entity_placement.dart';
import 'package:muin/CoreUtils/routing_constants.dart';


class PagePlacement extends StatefulWidget {
  @override
  _PagePlacementState createState() => _PagePlacementState();
}

class _PagePlacementState extends State<PagePlacement> {

  EntitiyPlacement ep;
  int siradaki;

  String c1;
  String c2;
  String c3;

  String s1;
  String s2;
  String s3;

  @override
  void initState() {
    ep = EntitiyPlacement();
    List<String> l = List();
    this.siradaki = 0;

    l = ep.getRandomThree();

    this.s1 = l[0]; this.s2 = l[1]; this.s3 = l[2];
    this.c1 = "?"; this.c2 = "?"; this.c3 = "?";


    // TODO: implement initState
    super.initState();
  }


  bool check(){
    if(this.c1 != "?" && this.c2 != "?" && this.c3 != "?") {
      return this.ep.check(liste : [this.c1,this.c2,this.s3]);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Placement"),),
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
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: <Widget>[
                    RaisedButton( child: Text(this.c1), onPressed: (){
                      this.siradaki = 0;
                      this.c1 = "?";
                      setState(() {});
                    },),
                    Container(child: Text(">", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),),
                    RaisedButton( child: Text(this.c2), onPressed: (){
                      this.siradaki = 1;
                      this.c2 = "?";
                      setState(() {});
                    },),
                    Container(child: Text(">", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),),
                    RaisedButton( child: Text(this.c3), onPressed: (){
                      this.siradaki = 2;
                      this.c3 = "?";
                      setState(() {});
                    },),
                  ],
                ),
                Divider(),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: <Widget>[
                    Text("Aşağıdaki kelimeleri büyükten küçüğe sıralayınız."),
                    Divider(),
                    RaisedButton(child: Text(this.s1), onPressed: (){
                      if   (this.siradaki == 0)  {this.c1 = this.s1;}
                      else if(this.siradaki == 1){this.c2 = this.s1;}
                      else                       {this.c3 = this.s1;}

                      if(this.siradaki < 2) {this.siradaki++;} else {this.siradaki = 0;}
                      if(this.check()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                      setState(() {});
                    },),
                    RaisedButton(child: Text(this.s2), onPressed: (){
                      if   (this.siradaki == 0)  {this.c1 = this.s2;}
                      else if(this.siradaki == 1){this.c2 = this.s2;}
                      else                       {this.c3 = this.s2;}

                      if(this.siradaki < 2) {this.siradaki++;} else {this.siradaki = 0;}
                      if(this.check()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                      setState(() {});
                    },),
                    RaisedButton(child: Text(this.s3), onPressed: (){
                      if   (this.siradaki == 0)  {this.c1 = this.s3;}
                      else if(this.siradaki == 1){this.c2 = this.s3;}
                      else                       {this.c3 = this.s3;}

                      if(this.siradaki < 2) {this.siradaki++;} else {this.siradaki = 0;}
                      if(this.check()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                      setState(() {});
                    },),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      );
  }
}
