class User{
  Name name ;
  Picture picture ;
  String email ;
  String phone ;
  User({
    required this.name ,
    required this.picture ,
    required this.email ,
    required this.phone
});
  User.fromJson(Map<String , dynamic> map):
        name = Name.fromJson(map['name'] ) ,
        picture =  Picture.fromJson(map['picture']) ,
        email =  map['email'] ,
        phone = map['phone'];
}
class Name{
  String last;
  String first;

  Name({required this.last, required this.first});
   Name.fromJson(Map<String , dynamic> map):
      last = map['last'] ,
      first = map['first'];

}
class Picture{
  String medium;

  Picture({required this.medium});
  Picture.fromJson(Map<String , dynamic> map):
      medium = map['medium'];
}