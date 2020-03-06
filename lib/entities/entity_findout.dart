


class EntityFindOut{
  final unite1 = {
    "teenagers" : "gençler",
    "amusement park" : "lunapark",
    "meet friends"	: "arkadaşlarla buluşmak",
    "action" :	"aksiyon"
  };

  EntityFindOut();

  List<String> getUnite({String unite = "1"}){
    if(unite == "1") {
      return this.unite1.keys.toList();
    }


  }
}