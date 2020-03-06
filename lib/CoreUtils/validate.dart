

//form widget in validate isleminde
//null dogru-gecti anlaminda kullanilir
//bu yuzden eger bir String donduysem hata,
//null donduysem dogru anlamindadir.
class Validate {


  static String email(String value){
    return null;
  }

  static String password(String value){
    return null;
    /*
    value = value.trim();
    if(value.length < 6 || value.length > 16) {
      return "Oluşturacağınız şifre 6 karakterden az 16 karakterden fazla olamaz";
    }
    return null;
    */
  }
}