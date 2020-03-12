import 'package:flutter/material.dart';
import 'dart:math';


class PageGameColorNumber extends StatefulWidget {
  @override
  _PageGameColorNumberState createState() => _PageGameColorNumberState();
}

class _PageGameColorNumberState extends State<PageGameColorNumber> {
  Generator g;
  List<ColorNumber> liste;
  List<String> sayiRenk;
  int score;

  @override
  void initState() {
    this.g = Generator();
    this.liste = List();
    this.liste = g.generate();
    this.sayiRenk = g.soruSor();
    this.score = 0;

    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Number"),),
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
                    Text(this.sayiRenk[0], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),),
                    SizedBox(width: 20,),
                    Text(this.sayiRenk[1], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),),
                  ],
                ),
                Divider(),
                Text("Score: ${this.score}"),
                Divider(),
                GridView.count(
                  crossAxisCount: 6,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(this.liste.length, (index) {
                    return Center(
                      child: Box(cn: this.liste[index], check: this.check,),
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

  bool check(String number, Color color){

    if(color.value.toString() == "4294961979"){

      if(this.sayiRenk[0] == number && this.sayiRenk[1] == "yellow"){
        this.score++;
      }

      debugPrint("sari");
    }
    if(color.value.toString() == "4294198070"){
      debugPrint("kirmizi");
    }
    if(color.value.toString() == "4283215696"){
      debugPrint("yesil");
    }
    if(color.value.toString() == "4280391411"){
      debugPrint("mavi");
    }


    if(color == Colors.red){
      debugPrint("kirmizi" + " - " + number);
    }




    this.score++;
    debugPrint(this.score.toString());


    setState(() {});
    return true;
  }
}


class ColorNumber{
  String number;
  Color color;
  ColorNumber({this.number, this.color});
}

class Generator{
  List<ColorNumber> listem;

  List<Color> colors;
  List<String> numbers;
  List<String> colorsName;
  List<String> numbersName;
  Random rnd;

  Generator(){
    this.listem = List();
    this.colors = List();
    this.numbers = List();
    this.listem = List();
    this.numbersName = List();
    this.colorsName = List();
    rnd = Random();

    colors.addAll([Colors.blue, Colors.green, Colors.yellow, Colors.red]);
    colorsName.addAll(["Blue", "Green", "Yellow", "Red"]);
    numbers.addAll(["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]);
    numbersName.addAll(["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Zero"]);

  }

  List<ColorNumber> generate(){
    this.colors.shuffle();
    this.numbers.shuffle();

    for(int i = 0; i < 48; i++){
      this.listem.add(ColorNumber(number: this.numbers[rnd.nextInt(this.numbers.length)], color: this.colors[rnd.nextInt(this.colors.length)]));
    }

    return this.listem;
  }

  List<String> soruSor(){
    //var olanlardan sor olmayani sorma...
    return [this.numbersName[this.rnd.nextInt(this.numbersName.length)],this.colorsName[this.rnd.nextInt(this.colorsName.length)]];
  }
}



class Box extends StatefulWidget {
  final ColorNumber cn;
  Function check;
  Box({Key key, this.cn, this.check}) : super(key : key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: RaisedButton(
        color: widget.cn.color,
        child: Text(widget.cn.number),
        onPressed: (){
          widget.check(widget.cn.number, widget.cn.color);
        },
      ),
    );
  }
}


/*
* sistem gelistirmeleri
*
* patlayan nokta ne? gerekli bilgiler neler?
* 2 bilgi var renk ve sayi
* renk Colors.red ve red seklinde
* sayilar 1 ve one seklinde
* bir bilgi 2 farkli sekilde tutuluyor.
*
* nesne icinde 4 alan acmak mi daha mantikli yoksa donusturucu bir function mu?
* ayrica generator ve entity classi birlestirmek iyi bir fikir mi?
*
* 1-one donusumu entity sorumlulugunda olan bir bilgidir get-set
*
* getNumberInt, getNumberString , getColorObj, getColorString seklinde olmasi iyi bir fikir.
*
* ayrica entity objesini yaratip birakmak degil kontrol etmek sorundayim.
* cunku su listede olmayan bir eleman sorabiliyorum..
* bu durumun degismesi gerekir
*
* bir diger ayrintida kullanici dogru bilirse butonu kullanamaz hale getirmeli-rengini degistirmeli
* yanlis basarsa puanini dusurmeliyim.
*
* ayrica hepsi tamamlandiginda result a ulasmali yani uygulamayi birtirmelidir.
*
* eklenice kfeature lar ve yapilacak duzeltmeler bunlar
*
* */


























