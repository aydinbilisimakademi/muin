import 'package:flutter/cupertino.dart';

class Soru{
  int id;
  String soruKoku;
  String cevapA;
  String cevapB;
  String cevapC;
  String cevapD;
  int cevapDogru;
  int cevapKullanici;

  static final columns = ["id", "soruKoku", "cevapA", "cevapB", "cevapC", "cevapD", "cevapDogru", "cevapKullanici"];

  Soru(this.id, this.soruKoku, this.cevapA, this.cevapB, this.cevapC, this.cevapD, this.cevapDogru);

  factory Soru.fromMap(Map<String, dynamic> data){
    return Soru(
      data["id"],
      data["soruKoku"],
      data["cevapA"],
      data["cevapB"],
      data["cevapC"],
      data["cevapD"],
      data["cevapDogru"],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "soruKoku": this.id,
    "cevapA": this.id,
    "cevapB": this.id,
    "cevapC": this.id,
    "cevapD": this.id,
    "cevapDogru": this.id,
  };
}


//!!!!!!!!!!!!!!!!!!!evaplarin bir minimum degeri olmali. eksik kalirsa bosluk ile tamamlanmali



class QuizBuilder{
  /*
  * gerekli bilgiler
  * */
  String dersKonusu;
  String testCode;        //veritabanindan ya da internetteki bir sunucudan bu koda gore cekicegim eger kod yoksa ya da bendeki kod ile sunucudaki farkli ise soru yok ya da degismis demektir (md5checksum) o halde sunucudan tekrar cekilir ve yuklenir. sonuna bir sayi ekleip dosya boyutu ?
  List<Soru> sorular;
  int siradakiSoru;
  double sonuc;

  QuizBuilder({this.dersKonusu, this.testCode, this.siradakiSoru}){
    init(this.testCode);
    siradakiSoru == null ? this.siradakiSoru = 0 : this.siradakiSoru = siradakiSoru;
  }

  void init(String testCode){

    //egerki bu koda sahip olan test sqlite veritabanimda yok ise (md5checksum())
    //sunucuya baglanip sorulari cekiyorum
    //ardindan sqlite veritabanina ekliyorum
    //sonrasinda sqlite veritabanindan okuyup listeme ekliyorum

    this.sorular = List<Soru>();

    SoruEkle(new Soru(1, "What color is a strawberry?", "blue", "red", "yellow", "orange", 1));
    SoruEkle(new Soru(2, "What color is a banana?", "pink", "red", "black", "yellow", 3));
    SoruEkle(new Soru(3, "What color is the Turkish flag?", "Green and blue", "Red and white", "Blue and white", "Red and yellow", 1));
    SoruEkle(new Soru(4, "What is the color of a sea?", "blue", "white", "grey", "brown", 0));
    SoruEkle(new Soru(5, "What color is grass?", "It is brown.", "It is green.", "It is purple.", "It is white.", 1));
    SoruEkle(new Soru(6, "Mavi rengi hangi şıktadır?", "blue", "gyan", "yellow", "green", 0));
    SoruEkle(new Soru(7, "Mavi ve sarı renkleri karşıcınca hangi renk oluşur?", "blue", "yellow", "green", "pink", 2));
    SoruEkle(new Soru(8, "Pembe renginin karşılığı?", "blue", "orange", "green", "pink", 3));
    SoruEkle(new Soru(9, "Turuncu rengin karşılığı nedir?", "blue", "orange", "green", "pink", 1));
    SoruEkle(new Soru(10, "What is the color of cloud?", "pink", "white", "blue", "green", 1));
  }

  void SoruEkle(Soru soru){
    this.sorular.add(soru);
  }

  //eger null donerse test bitmis demektir.
  Soru getSoru(){
    if(siradakiSoru >= this.sorular.length) { debugPrint("sorular bitti geri donus null"); return null; }  //test bitti sinyali direk bilgiyi okudugum icin hata verir..
    return this.sorular[this.siradakiSoru];
  }

  double getQuizResult(){
    int dogruSayisi = 0;
    this.sorular.forEach((v) => v.cevapDogru == v.cevapKullanici ?  dogruSayisi++ : dogruSayisi = dogruSayisi );
    return ((100 * dogruSayisi) / this.sorular.length);
  }

  void Clear(){
    this.sorular = null;
    this.siradakiSoru = 0;
    this.testCode = null;
    this.sonuc = 0;
    this.dersKonusu = null;
  }

  bool isEmpty(){
    return this.testCode == null;
  }


  voidInitDatabase(){} //sqlite veritabaninda tablo yaratma islemleri bir yerde olmasi ilk kurulum esnasinda kullanilamaz mi?


}












