class SliderModel {
  bool? success;
  String? message;
  late List<SliderData> banners=[] ;

  SliderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];

    if (json['data'] != null) {
      json['data'].forEach((element) {
        banners.add(SliderData.fromJson(element));
      });
    }
  }
}

class SliderData {
  int? id;
  String? image;

  SliderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}


