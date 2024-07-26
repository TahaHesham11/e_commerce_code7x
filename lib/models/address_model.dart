class AddressModel {
  bool? success;
  String? message;
  List<AddressData>? data;



  AddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AddressData>[];
      json['data'].forEach((v) {
        data!.add( AddressData.fromJson(v));
      });
    }
  }

}

class AddressData {
  int? id;
  String? title;
  String? address;
  bool? isDefault;
  String? latitude;
  String? longitude;
  dynamic cityId;
  dynamic regionId;



  AddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    isDefault = json['is_default'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cityId = json['city_id'];
    regionId = json['region_id'];
  }


}
