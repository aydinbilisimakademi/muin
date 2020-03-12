import 'package:flutter/material.dart';
import 'dart:math';

class EntityColorNumber{
  String number;
  Color color;
  EntityColorNumber({this.number, this.color});

  static Map<String, String>_MAP_NUMBER = {"1" : "one", "2" : "two", "3" : "three", "4" : "four", "5" : "five", "6" : "six", "7" : "seven", "8" : "eight", "9" : "nine", "0" : "zero"};
  static Map<Color, String> _MAP_COLOR = {Colors.red : "red", Colors.blue : "blue", Colors.yellow : "yellow", Colors.green : "green", Colors.black : "black"};

  //getNumberInt, getNumberString , getColorObj, getColorString

  String getNumberIntRepresent(){
    return this.number;
  }
  String getNumberStringRepresent(){
    return EntityColorNumber._MAP_NUMBER[this.number];
  }
  Color getColorOBJRepresent(){
    return this.color;
  }
  String getColorStringRepresent(){
    return EntityColorNumber._MAP_COLOR[this.color];
  }
}


class EntityMenagerColorsNumbers{
  List<EntityColorNumber> entitycolorsnumbers;
  List<Color> colors;
  List<String> numbers;
  Random rnd;


  EntityMenagerColorsNumbers(){
    this.colors = List();
    this.numbers = List();
    this.entitycolorsnumbers = List();
    this.rnd = Random();

    this.colors.addAll([Colors.blue, Colors.green, Colors.yellow, Colors.red]);
    this.numbers.addAll(["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]);
  }

  List<EntityColorNumber> generate(){
    this.numbers.shuffle();
    this.colors.shuffle();
    for(int i = 0; i < 48; i++){ //48
      this.entitycolorsnumbers.add(EntityColorNumber(number: this.numbers[rnd.nextInt(this.numbers.length)], color: this.colors[rnd.nextInt(this.colors.length)]));
    }
    this.entitycolorsnumbers.shuffle();
    return this.entitycolorsnumbers;
  }

  EntityColorNumber askQuestion(){
    if(this.allDone()) {
      return null;
    }
    else{
      EntityColorNumber temp;
      while(true){
        temp = this.entitycolorsnumbers[rnd.nextInt(this.entitycolorsnumbers.length)];
        if(temp.getColorOBJRepresent() != Colors.black){
          break;
        }
      }
      return temp;
    }
  }


  bool allDone(){
    //eger hepsi black ise return true - degilse false
    bool sonuc = true;
    //this.entitycolorsnumbers.forEach((element) {if(element.color == Colors.black){ sonuc = false; break;}});
    for(int i = 0; i < this.entitycolorsnumbers.length; i++){
      if(this.entitycolorsnumbers[i].color != Colors.black){
        sonuc = false;
        break;
      }
    }
    return sonuc;
  }


}