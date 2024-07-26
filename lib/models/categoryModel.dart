class CategoryModel {
  bool? status;
  dynamic message;
  Data? data;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int currentPage;
  List<DataCategory> data = [];
  String firstPageUrl;
  int from;
  int lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'],
        firstPageUrl = json['first_page_url'],
        from = json['from'],
        lastPage = json['last_page'],
        lastPageUrl = json['last_page_url'],
        nextPageUrl = json['next_page_url'],
        path = json['path'],
        perPage = json['per_page'],
        prevPageUrl = json['prev_page_url'],
        to = json['to'],
        total = json['total'] {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(DataCategory.fromJson(v));
      });
    }
  }
}

class DataCategory {
  int? id;
  String? name;
  String? image;
  List<SubCategory> subCategories = [];

  DataCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'] {
    if (json['sub_categories'] != null) {
      json['sub_categories'].forEach((v) {
        subCategories.add(SubCategory.fromJson(v));
      });
    }
  }
}

class SubCategory {
  int? id;
  String? name;
  String? description;
  String? slug;
  int? parentId;
  String? image;
  String? thumbnail;
  int? isActive;

  SubCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        slug = json['slug'],
        parentId = json['parent_id'],
        image = json['image'],
        thumbnail = json['thumbnail'],
        isActive = json['is_active'];
}
