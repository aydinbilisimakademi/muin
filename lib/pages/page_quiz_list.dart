import 'package:flutter/material.dart';
import 'package:muin/CoreUtils/routing_constants.dart';


class PageQuizList extends StatelessWidget {
  final testListesi = ["Renkler", "Mutfak Gereçleri", "Hayvanat Bahçesi", "Akrabalar", "Trafik",];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Testler"),),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: testListesi.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                color: Colors.white30,
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage("assets/images/colors.png"),),
                  title: Text('${testListesi[index]}'),
                  subtitle: Text('10 soru'),
                  trailing: Icon(Icons.play_arrow,color: Colors.blue, size: 60,),
                ),
              ),
              onTap: (){
                Navigator.of(context).pushNamed(PageRouteQuiz);
              },
            );
          },
        ),
      ),
    );
  }
}
