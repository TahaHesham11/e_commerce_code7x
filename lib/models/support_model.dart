class SupportModel {
  final bool? success;
  final String? message;
  final Data? data;

  SupportModel({
    this.success,
    this.message,
    this.data,
  });

  SupportModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic subject;
  final dynamic isSeen;
  final String? message;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.subject,
    this.isSeen,
    this.message,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        phone = json['phone'] as String?,
        subject = json['subject'],
        isSeen = json['is_seen'],
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
    'phone' : phone,
    'subject' : subject,
    'is_seen' : isSeen,
    'message' : message
  };
}