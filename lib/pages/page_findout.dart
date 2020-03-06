import 'package:flutter/material.dart';
import "package:muin/entities/entity_findout.dart";

class PageFindOut extends StatefulWidget {
  @override
  _PageFindOutState createState() => _PageFindOutState();
}

class _PageFindOutState extends State<PageFindOut> {
  EntityFindOut efo;
  List<String> kelimelerim;

  @override
  void initState() {
    this.efo = EntityFindOut();
    this.kelimelerim = List();
    this.kelimelerim = efo.getUnite();
    this.kelimelerim.shuffle();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Out"),
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
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/unite_1/1.jpg"),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: this.kelimelerim.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FlatButton(child: Text(this.kelimelerim[index]), onPressed: (){},);
                      },
                    ),
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
