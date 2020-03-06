import 'dart:math';

class EntityMatch{

  var sozluk = {};

  EntityMatch(){
    sozluk = {
      "aggressive" : "sinirli",
      "buddy" : "kanka",
      "calm" : "sakin",
      "duty" : "görev",
      "fair" : "adil",
      "generous" : "dürüst",
      "loyal" : "sadık",
      "trust" : "güvenmek"
    };
  }

  //cekilen kelimenini bir daha cekilmemesi gerekli..
  String getRandomKey(){
    return this.sozluk.keys.elementAt(new Random().nextInt(this.sozluk.length));
  }
  String getRandomValue(){
    return this.sozluk.values.elementAt(new Random().nextInt(this.sozluk.length));
  }

  List<String> getRandomCouple(){
    String en = this.sozluk.keys.elementAt(new Random().nextInt(this.sozluk.length));
    String tr = this.sozluk[en];
    return [en, tr];
  }

  bool check(String key, String value){
    return this.sozluk[key] == value;
  }

}