// class VerifiyModel {
//   late bool success;
//   late String message;
//   late Data data;
//
//
//   VerifiyModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
//
//   }
//
//
// }
//
// class Data {
//   late String token;
//   late User user;
//
//
//   Data.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
//   }
//
//
// }
//
// class User {
//  late int id;
//  late String email;
//  late String fname;
//  late String lname;
//  late String phone;
//  late String locale;
//  late Country country;
//  late Null region;
//  late Null city;
//  late Null district;
//  late Null birthDate;
//  late Null gender;
//  late List<Null> addresses;
//  late int blocked;
//  late String createdAt;
//  late String updatedAt;
//
//
// User.fromJson(Map<String, dynamic> json) {
// id = json['id'];
// email = json['email'];
// fname = json['fname'];
// lname = json['lname'];
// phone = json['phone'];
// locale = json['locale'];
// country = (json['country'] != null ?  Country.fromJson(json['country']) : null)!;
// region = json['region'];
// city = json['city'];
// district = json['district'];
// birthDate = json['birth_date'];
// gender = json['gender'];
// blocked = json['blocked'];
// createdAt = json['created_at'];
// updatedAt = json['updated_at'];
// }
//
//
// }
//
// class Country {
// late int id;
// late String iso;
// late String name;
// late String iso3;
// late int numcode;
// late int phonecode;
//
//
// Country.fromJson(Map<String, dynamic> json) {
// id = json['id'];
// iso = json['iso'];
// name = json['name'];
// iso3 = json['iso3'];
// numcode = json['numcode'];
// phonecode = json['phonecode'];
// }
//
//
// }


class VerifyModel {
  late bool success;
  late String message;
  Data? data;

  VerifyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    message = json['message'] ?? '';
    if (json['data'] is Map<String, dynamic>) {
      data = Data.fromJson(json['data']);
    } else {
      data = null;
    }
  }
}

class Data {
  late String token;
  late User user;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    user = User.fromJson(json['user'] ?? {});
  }
}

class User {
  late int id;
  late String email;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    email = json['email'] ?? '';
  }
}
