import 'package:flutter/material.dart';
import 'package:muin/entities/entity_quiz.dart';
import 'package:muin/CoreUtils/routing_constants.dart';

class PageQuiz extends StatefulWidget {
  @override
  _PageQuizState createState() => _PageQuizState();
}

class _PageQuizState extends State<PageQuiz> {
  QuizBuilder quiz = new QuizBuilder(
      dersKonusu: "Hayvanlar", siradakiSoru: 0, testCode: "aassdd");
  Soru soru;

  void init() {
    if (quiz.siradakiSoru < quiz.sorular.length) {
      soru = quiz
          .getSoru(); //bunun bir metod icinde cagrilmasi gerekli. aksi durumda ilk bu cagriliyor ve null pointer exception olusuyor...
    }

    if (soru == null && soru.soruKoku == null) {
      soru.soruKoku = "";
      soru.cevapA = "";
      Navigator.of(context)
          .pushNamed(PageRouteResult, arguments: quiz.getQuizResult());
    }
  }

  void next() {
    if (quiz.siradakiSoru >= quiz.sorular.length - 1) {
      Navigator.of(context)
          .pushNamed(PageRouteResult, arguments: quiz.getQuizResult());
    }
    this.soru = quiz.getSoru();
    quiz.siradakiSoru = quiz.siradakiSoru >= quiz.sorular.length - 1
        ? quiz.siradakiSoru
        : quiz.siradakiSoru + 1;
    debugPrint(soru.soruKoku);
    setState(() {});
  }

  void prev() {
    quiz.siradakiSoru =
        quiz.siradakiSoru == 0 ? quiz.siradakiSoru = 0 : quiz.siradakiSoru - 1;
    this.soru = quiz.getSoru();
    debugPrint(soru.soruKoku);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Page"),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 30, top: 20, left: 15, right: 15),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text((this.quiz.siradakiSoru + 1).toString() +
                    "/" +
                    (this.quiz.sorular.length).toString())
              ],
            ),
            Divider(
              height: 100,
            ),
            Text(soru.soruKoku == null ? "" : soru.soruKoku, style: TextStyle(fontSize: 16),),
            Divider(color: Colors.black, height: 5.0,),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text("A-) " + soru.cevapA),
                      color: Colors.white,
                      textColor: Colors.black,
                      splashColor: Colors.blueAccent,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        soru.cevapKullanici = 0;
                        this.next();
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text("B-) " + soru.cevapB),
                      color: Colors.white,
                      textColor: Colors.black,
                      splashColor: Colors.blueAccent,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        soru.cevapKullanici = 1;
                        this.next();
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text("C-) " + soru.cevapC),
                      color: Colors.white,
                      textColor: Colors.black,
                      splashColor: Colors.blueAccent,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        soru.cevapKullanici = 2;
                        this.next();
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text("D-) " + soru.cevapD),
                      color: Colors.white,
                      textColor: Colors.black,
                      splashColor: Colors.blueAccent,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        soru.cevapKullanici = 3;
                        this.next();
                      },
                    ),
                  ],
                ),
              ],
            ),

            Divider(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    child: Text("Prev"),
                    onPressed: () {
                      this.prev();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    child: Text("Next"),
                    onPressed: () {
                      this.next();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
