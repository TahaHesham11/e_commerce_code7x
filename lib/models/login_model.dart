class LoginModel {
  late final bool success;
  late final String message;
  late final Data? data;

  LoginModel.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        data = json['data'] != null ? Data.fromJson(json['data']) : null;


}

class Data {
  late final int id;
  late final String? email;
  late final String? fname;
  late final String? lname;
  late final String? phone;
  late final String? locale;
  late final dynamic region;
  late final dynamic city;
  late final dynamic district;
  late final dynamic birthDate;
  late final dynamic gender;
  late final int blocked;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        fname = json['fname'],
        lname = json['lname'],
        phone = json['phone'],
        locale = json['locale'],
        region = json['region'], // يمكنك استخدام ? للسماح بالقيم النُّل
        city = json['city'],
        district = json['district'],
        birthDate = json['birthDate'],
        gender = json['gender'],
        blocked = json['blocked'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}


// class Country {
//
// late final int id;
// late final String iso;
// late final String name;
// late final String iso3;
// late final int numcode;
// late final int phonecode;
//
// Country.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   iso = json['iso'];
//   name = json['name'];
//   iso3 = json['iso3'];
//   numcode = json['numcode'];
//   phonecode = json['phonecode'];
// }
//
// Map<String, dynamic> toJson() {
// final _data = <String, dynamic>{};
// _data['id'] = id;
// _data['iso'] = iso;
// _data['name'] = name;
// _data['iso3'] = iso3;
// _data['numcode'] = numcode;
// _data['phonecode'] = phonecode;
// return _data;
// }
// }
//
// class Addresses {
// Addresses({
// required this.id,
// required this.title,
// required this.address,
// required this.isDefault,
// this.latitude,
// this.longitude,
// required this.cityId,
// required this.regionId,
// this.districtId,
// });
// late final int id;
// late final String title;
// late final String address;
// late final bool isDefault;
// late final String? latitude;
// late final String? longitude;
// late final int cityId;
// late final int regionId;
// late final Null districtId;
//
// Addresses.fromJson(Map<String, dynamic> json){
// id = json['id'];
// title = json['title'];
// address = json['address'];
// isDefault = json['is_default'];
// latitude = null;
// longitude = null;
// cityId = json['city_id'];
// regionId = json['region_id'];
// districtId = null;
// }
//
// }