class ShopLoginModel{
  late bool status;
  late String message;
 late UserData data;
  ShopLoginModel.fromJson(Map<String , dynamic>json){
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? UserData.fromJson(json['data']) :null)!;
  }
}
class UserData{
 late int id;
 late  String email;
 late String name;
 late String phone;
 late  String image;
 late  String token;
 late  int points;
 late  int credit;
 UserData.fromJson(Map<String , dynamic>json){
   id = json['id'];
   email = json['email'];
   name = json['name'];
   phone = json['phone'];
   image = json['image'];
   token = json['token'];
   points = json['points'];
   credit = json['credit'];
 }
}