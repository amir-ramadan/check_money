class UserModel {
  late String name;
  late String email;
  late String uid;
  String? date;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    required this. date,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uid = json['uid'];
    date = json['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'date': date,
    };
  }
}