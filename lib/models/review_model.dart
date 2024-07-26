class ReviewModel {
  bool? success;
  String? message;
  List<ReviewData>? data;


  ReviewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ReviewData>[];
      json['data'].forEach((v) {
        data!.add( ReviewData.fromJson(v));
      });
    }
  }


}

class ReviewData {
  int? id;
  String? comment;
  int? rating;
  int? isApproved;
  String? createdAt;


  ReviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    rating = json['rating'];
    isApproved = json['is_approved'];
    createdAt = json['created_at'];
  }

}
