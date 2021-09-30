class UserModel {
  String name = "";
  String age = "";
  String state = "";
  String country = "";
  List images = [];
  String bio = "";
  late int id;

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? "" : json['name'];

    id = json['id'] == null ? 0 : json['id'];
    age = json['age'] == null ? "" : json['age'].toString();
    state = json['state'] == null ? "" : json['state'];
    country = json['country'] == null ? "" : json['country'];
    images = json['images'] == null ? "" : json['images'];
    bio = json['bio'] == null ? "" : json['bio'];
  }
}
