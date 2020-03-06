


class EntityUser {
  int id;
  String name;
  String email;
  String password;
  String circleAvatarURL;
  DateTime createTime = DateTime.now();

  EntityUser({this.id, this.name, this.email, this.password, this.circleAvatarURL});

  static final columns = ["id","name","email","password","circleAvatarURL","createTime"];

  factory EntityUser.fromMap(Map<String, dynamic> data){
    return EntityUser(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      password: data['password'],
      circleAvatarURL: data['circleAvatarURL'],
    );
  }

  Map<String, dynamic> toMap()=> {
    "id" : id,
    "name" : name,
    "email" : email,
    "password" : password,
    "circleAvatarURL" : circleAvatarURL,
    "createTime" : createTime
  };
}