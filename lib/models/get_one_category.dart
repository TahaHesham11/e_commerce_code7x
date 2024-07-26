class GetOneCategories {
  final bool? success;
  final String? message;
  final Data? data;



  GetOneCategories.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

}

class Data {
  late final int id;
  final String? name;
  final String? description;
  final String? slug;
  final dynamic parentId;
  final dynamic parent;
  final List<DataCategories>? dataCategories;
  final String? image;
  final String? thumbnail;
  final int? isActive;



  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] ,
        name = json['name'] as String?,
        description = json['description'] as String?,
        slug = json['slug'] as String?,
        parentId = json['parent_id'],
        parent = json['parent'],
        dataCategories = (json['sub_categories'] as List?)?.map((dynamic e) => DataCategories.fromJson(e as Map<String,dynamic>)).toList(),
        image = json['image'] as String?,
        thumbnail = json['thumbnail'] as String?,
        isActive = json['is_active'] as int?;

}

class DataCategories {
  final int? id;
  final String? name;
  final String? description;
  final String? slug;
  final int? parentId;
  final List<dynamic>? subCategories;
  final String? image;
  final String? thumbnail;
  final int? isActive;



  DataCategories.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        slug = json['slug'] as String?,
        parentId = json['parent_id'] as int?,
        subCategories = json['sub_categories'] as List?,
        image = json['image'] as String?,
        thumbnail = json['thumbnail'] as String?,
        isActive = json['is_active'] as int?;

}