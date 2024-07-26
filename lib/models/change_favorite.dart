class ChangeFavoriteModel {
  bool? success;
  String? message;
  late bool data;


  ChangeFavoriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
  }

}
