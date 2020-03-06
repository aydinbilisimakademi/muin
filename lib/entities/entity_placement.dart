import 'dart:math';

class EntitiyPlacement{

  final days = {
    "Sunday" : 0,
    "Monday" : 1,
    "Tuesday" : 2,
    "Wednesday" : 3,
    "Thursday" : 4,
    "Friday" : 5,
    "Saturday" : 6
  };
  final months = {
    "January" : 0,
    "February" : 1,
    "March" : 2,
    "April" : 3,
    "May" : 4,
    "June" : 5,
    "July" : 6,
    "August" : 7,
    "September" : 8,
    "October" : 9,
    "November" : 10,
    "December" : 11
  };
  final numbersOneTen = {
    "zero" : 0,
    "one" : 1,
    "two" : 2,
    "three" : 3,
    "four" : 4,
    "five" : 5,
    "six" : 6,
    "seven"  : 7,
    "eight" : 8,
    "nine" : 9,
    "ten" : 10
  };

  final _random = new Random();

  List<String> getRandomThree(){
    List<String> threeElement = List();
    for(int i = 0; i < 3; i ++){
      threeElement.add(this.numbersOneTen.keys.elementAt(this._random.nextInt(this.numbersOneTen.length)));
    }
    return threeElement;
  }

  bool check({List<String> liste, bool buyuktenkucuge=true}){

    List<int> values = List();

    liste.forEach((element) {
      values.add(this.numbersOneTen[element]);
    });

    if(buyuktenkucuge){
      for(int i = 0; i < values.length; i++){
        for(int j = i; j < values.length - 1; j++){
          if(values[i] < values[j]) {
            return false;
          }
        }
      }
    }
    else{
      for(int i = 0; i < values.length; i++){
        for(int j = i; j < values.length - 1; j++){
          if(values[i] > values[j]) {
            return false;
          }
        }
      }
    }
    return true;
  }

}




