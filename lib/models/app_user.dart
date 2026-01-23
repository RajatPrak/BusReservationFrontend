class AppUser {
  int? id;
  String userName;
  String password;

  AppUser({
    this.id,
    required this.userName,
    required this.password,
  });

  Map<String,dynamic> toJson(){
    return{
      "userName":userName,
      "password":password
    };
  }
}
