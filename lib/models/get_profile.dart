class ProfileModel {
  final bool? success;
  final String? message;
  final Data? data;

  ProfileModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
}

class Data {
  final int? id;
  final String? email;
  final String? fname;
  final String? lname;
  final String? phone;
  final String? locale;
  final Country? country;
  final Region? region;
  final City? city;
  final District? district;
  final String? birthDate;
  final String? gender;
  final List<Addresses>? addresses;
  final int? blocked;
  final String? createdAt;
  final String? updatedAt;

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        email = json['email'] as String?,
        fname = json['fname'] as String?,
        lname = json['lname'] as String?,
        phone = json['phone'] as String?,
        locale = json['locale'] as String?,
        country = (json['country'] as Map<String, dynamic>?) != null
            ? Country.fromJson(json['country'] as Map<String, dynamic>)
            : null,
        region = (json['region'] as Map<String, dynamic>?) != null
            ? Region.fromJson(json['region'] as Map<String, dynamic>)
            : null,
        city = (json['city'] as Map<String, dynamic>?) != null
            ? City.fromJson(json['city'] as Map<String, dynamic>)
            : null,
        district = (json['district'] as Map<String, dynamic>?) != null
            ? District.fromJson(json['district'] as Map<String, dynamic>)
            : null,
        birthDate = json['birth_date'] as String?,
        gender = json['gender'] as String?,
        addresses = (json['addresses'] as List<dynamic>?)
            ?.map((item) => Addresses.fromJson(item as Map<String, dynamic>))
            .toList(),
        blocked = json['blocked'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;
}

class Country {
  final int? id;
  final String? iso;
  final String? name;
  final String? iso3;
  final int? numcode;
  final int? phonecode;



  Country.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        iso = json['iso'] as String?,
        name = json['name'] as String?,
        iso3 = json['iso3'] as String?,
        numcode = json['numcode'] as int?,
        phonecode = json['phonecode'] as int?;

}

class Region {
  final int? id;
  final String? name;


  Region.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;


}

class City {
  final int? id;
 late final String name;



  City.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] ;


}

class District {
  final int? id;
  final String? name;



  District.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;


}

class Addresses {
  final int? id;
  final String? title;
  final String? address;
  final bool? isDefault;
  final String? latitude;
  final String? longitude;
  final int? cityId;
  final int? regionId;
  final dynamic districtId;


  Addresses.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        address = json['address'] as String?,
        isDefault = json['is_default'] as bool?,
        latitude = json['latitude'] as String?,
        longitude = json['longitude'] as String?,
        cityId = json['city_id'] as int?,
        regionId = json['region_id'] as int?,
        districtId = json['district_id'];

}
