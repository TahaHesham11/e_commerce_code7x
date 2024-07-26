class AddressUserModel {
  final bool? success;
  final String? message;
  final Data? data;



  AddressUserModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

}

class Data {
 late final int id;
 late final String title;
 late final String address;
 late final bool isDefault;
 late final dynamic latitude;
 late final dynamic longitude;
 late final int cityId;
 late final int regionId;
 late final dynamic districtId;



  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] ,
        title = json['title'] ,
        address = json['address'] ,
        isDefault = json['is_default'] ,
        latitude = json['latitude'],
        longitude = json['longitude'],
        cityId = json['city_id'],
        regionId = json['region_id'] ,
        districtId = json['district_id'];

}