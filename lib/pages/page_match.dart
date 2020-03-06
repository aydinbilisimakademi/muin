import 'package:flutter/material.dart';
import 'package:muin/entities/entity_match.dart';
import 'package:muin/CoreUtils/routing_constants.dart';


class ButtonState{
  final String data;
  Color color;
  ButtonState({this.data, this.color = Colors.yellow});
}


class PageMatch extends StatefulWidget {
  @override
  _PageMatchState createState() => _PageMatchState();
}

class _PageMatchState extends State<PageMatch> {

  EntityMatch em;
  List<ButtonState> btnStateTR;
  List<ButtonState> btnStateEN;

  int secilenTR; //direk dataya baksak olmaz mi? olmaz. butonlari eski haline getirebilmek icin index bilgisine ihtiyacim var..
  int secilenEN; //ya da yesil yapabilmek icin..

  //renkleri ilerde degistirmek istersem buradan halledebilirim
  //ButtonState clasi icindede degistirmeyi unutma..
  Color normal;
  Color secili;
  Color eslesmis;

  @override
  void initState() {

    normal = Colors.yellow;
    secili = Colors.blue;
    eslesmis = Colors.green;

    this.secilenTR = -1;
    this.secilenEN = -1;
    em = EntityMatch();
    this.btnStateEN = List();
    this.btnStateTR = List();
    for(int i = 0; i < 4; i++){
      List<String> d = em.getRandomCouple();
      this.btnStateEN.add(ButtonState(data: d[0]));
      this.btnStateTR.add(ButtonState(data: d[1]));
    }
    this.btnStateTR.shuffle();
    this.btnStateEN.shuffle();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Match"),),
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
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateTR[0].data}"),
                        ),
                        color: this.btnStateTR[0].color,
                        onPressed: () {
                          if(btnStateTR[0].color == this.eslesmis) { return; }
                          if(btnStateTR[0].color == this.normal) {
                            btnStateTR[0].color = this.secili;
                            this.secilenTR = 0;
                          }
                          else {btnStateTR[0].color = this.normal; this.secilenTR = -1;}

                          if(secilenEN >= 0) {
                              bool sonuc = check();
                              if(sonuc == false){
                                this.btnStateTR[this.secilenTR].color = this.normal;
                                this.btnStateEN[this.secilenEN].color = this.normal;
                                this.secilenEN = -1;
                                this.secilenTR = -1;
                              }
                              else{
                                this.btnStateTR[this.secilenTR].color = this.eslesmis;
                                this.btnStateEN[this.secilenEN].color = this.eslesmis;
                                this.secilenEN = -1;
                                this.secilenTR = -1;
                              }
                            }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                            setState(() {});
                          },
                      ),
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateTR[1].data}"),
                        ),
                        color: this.btnStateTR[1].color,
                        onPressed: () {
                          if(btnStateTR[1].color == this.eslesmis) { return; }
                          if(btnStateTR[1].color == this.normal) {
                            btnStateTR[1].color = this.secili;
                            this.secilenTR = 1;
                          }
                          else {btnStateTR[1].color = this.normal; this.secilenTR = -1;}

                          if(secilenEN >= 0) {
                            bool sonuc = check();
                            if(sonuc == false){
                              this.btnStateTR[this.secilenTR].color = this.normal;
                              this.btnStateEN[this.secilenEN].color = this.normal;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                            else{
                              this.btnStateTR[this.secilenTR].color = this.eslesmis;
                              this.btnStateEN[this.secilenEN].color = this.eslesmis;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                          }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateTR[2].data}"),
                        ),
                        color: this.btnStateTR[2].color,
                        onPressed: () {
                          if(btnStateTR[2].color == this.eslesmis) { return; }
                          if(btnStateTR[2].color == this.normal) {
                            btnStateTR[2].color = this.secili;
                            this.secilenTR = 2;
                          }
                          else {btnStateTR[2].color = this.normal; this.secilenTR = -1;}

                          if(secilenEN >= 0) {
                            bool sonuc = check();
                            if(sonuc == false){
                              this.btnStateTR[this.secilenTR].color = this.normal;
                              this.btnStateEN[this.secilenEN].color = this.normal;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                            else{
                              this.btnStateTR[this.secilenTR].color = this.eslesmis;
                              this.btnStateEN[this.secilenEN].color = this.eslesmis;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                          }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateTR[3].data}"),
                        ),
                        color: this.btnStateTR[3].color,
                        onPressed: () {
                          if(btnStateTR[3].color == this.eslesmis) { return; }
                          if(btnStateTR[3].color == this.normal) {
                            btnStateTR[3].color = this.secili;
                            this.secilenTR = 3;
                          }
                          else {btnStateTR[3].color = this.normal; this.secilenTR = -1;}

                          if(secilenEN >= 0) {
                            bool sonuc = check();
                            if(sonuc == false){
                              this.btnStateTR[this.secilenTR].color = this.normal;
                              this.btnStateEN[this.secilenEN].color = this.normal;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                            else{
                              this.btnStateTR[this.secilenTR].color = this.eslesmis;
                              this.btnStateEN[this.secilenEN].color = this.eslesmis;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                          }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Divider(height: 30,),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: <Widget>[
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateEN[0].data}"),
                        ),
                        color: this.btnStateEN[0].color,
                        onPressed: () {
                          if(btnStateEN[0].color == this.eslesmis) { return; }
                          if(btnStateEN[0].color == this.normal) {
                            btnStateEN[0].color = this.secili;
                            this.secilenEN = 0;
                          }
                          else {btnStateEN[0].color = this.normal; this.secilenEN = -1;}

                          if(secilenTR >= 0) {
                            bool sonuc = check();
                            if(sonuc == false){
                              this.btnStateTR[this.secilenTR].color = this.normal;
                              this.btnStateEN[this.secilenEN].color = this.normal;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                            else{
                              this.btnStateTR[this.secilenTR].color = this.eslesmis;
                              this.btnStateEN[this.secilenEN].color = this.eslesmis;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                          }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateEN[1].data}"),
                        ),
                        color: this.btnStateEN[1].color,
                        onPressed: () {
                          if(btnStateEN[1].color == this.eslesmis) { return; }
                          if(btnStateEN[1].color == this.normal) {
                            btnStateEN[1].color = this.secili;
                            this.secilenEN = 1;
                          }
                          else {btnStateEN[1].color = this.normal; this.secilenEN = -1;}

                          if(secilenTR >= 0) {
                            bool sonuc = check();
                            if(sonuc == false){
                              this.btnStateTR[this.secilenTR].color = this.normal;
                              this.btnStateEN[this.secilenEN].color = this.normal;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                            else{
                              this.btnStateTR[this.secilenTR].color = this.eslesmis;
                              this.btnStateEN[this.secilenEN].color = this.eslesmis;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                          }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateEN[2].data}"),
                        ),
                        color: this.btnStateEN[2].color,
                        onPressed: () {
                          if(btnStateEN[2].color == this.eslesmis) { return; }
                          if(btnStateEN[2].color == this.normal) {
                            btnStateEN[2].color = this.secili;
                            this.secilenEN = 2;
                          }
                          else {btnStateEN[2].color = this.normal; this.secilenEN = -1;}

                          if(secilenTR >= 0) {
                            bool sonuc = check();
                            if(sonuc == false){
                              this.btnStateTR[this.secilenTR].color = this.normal;
                              this.btnStateEN[this.secilenEN].color = this.normal;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                            else{
                              this.btnStateTR[this.secilenTR].color = this.eslesmis;
                              this.btnStateEN[this.secilenEN].color = this.eslesmis;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                          }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(20),
                          child: Text("${this.btnStateEN[3].data}"),
                        ),
                        color: this.btnStateEN[3].color,
                        onPressed: () {
                          if(btnStateEN[3].color == this.eslesmis) { return; }
                          if(btnStateEN[3].color == this.normal) {
                            btnStateEN[3].color = this.secili;
                            this.secilenEN = 3;
                          }
                          else {btnStateEN[3].color = this.normal; this.secilenEN = -1;}

                          if(secilenTR >= 0) {
                            bool sonuc = check();
                            if(sonuc == false){
                              this.btnStateTR[this.secilenTR].color = this.normal;
                              this.btnStateEN[this.secilenEN].color = this.normal;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                            else{
                              this.btnStateTR[this.secilenTR].color = this.eslesmis;
                              this.btnStateEN[this.secilenEN].color = this.eslesmis;
                              this.secilenEN = -1;
                              this.secilenTR = -1;
                            }
                          }
                          if(this.checkAllFinished()){Navigator.of(context).pushNamed(PageRouteResult, arguments: 100.0);}
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

  bool check(){
    return em.check(btnStateEN[secilenEN].data, btnStateTR[secilenTR].data);
  }

  bool checkAllFinished(){
    for(int i = 0; i < this.btnStateTR.length; i++){
      if(this.btnStateTR[i].color != Colors.green){
        return false;
      }
    }
    return true;
  }

}


