class NotificationModel {
  bool? success;
  String? message;
  List<Data>? data;


  NotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? id;
  int? isRead;
  String? createdAtForHumans;
  String? createdAt;
  String? notificationType;
  String? title;
  String? body;
  String? link;
  String? image;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isRead = json['is_read'];
    createdAtForHumans = json['created_at_for_humans'];
    createdAt = json['created_at'];
    notificationType = json['notification_type'];
    title = json['title'];
    body = json['body'];
    link = json['link'];
    image = json['image'];
  }

}
