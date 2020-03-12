import 'package:flutter/material.dart';


class Sayi{
  double data;

  void set(double data){
    this.data;
  }

  String get(){
    this.data.toString();
  }


}


class PageHesapMakinasi extends StatefulWidget {
  @override
  _PageHesapMakinasiState createState() => _PageHesapMakinasiState();
}

class _PageHesapMakinasiState extends State<PageHesapMakinasi> {
  Sayi sayi1;
  Sayi sayi2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}



class Ekran extends StatefulWidget {
  @override
  _EkranState createState() => _EkranState();
}

class _EkranState extends State<Ekran> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
