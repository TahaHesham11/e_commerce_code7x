class SettingModel {
  final bool? success;
  final String? message;
  final List<DataPage>? data;


  SettingModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => DataPage.fromJson(e as Map<String,dynamic>)).toList();

}

class DataPage {
  final int? id;
  final String? slug;
  final String? title;
  final String? content;
  final String? contentWithoutHtml;
  final bool? isPublished;
  final dynamic seoTitle;
  final dynamic seoUrl;
  final dynamic seoDescription;
  final String? createdAt;
  final String? updatedAt;


  DataPage.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        slug = json['slug'] as String?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        contentWithoutHtml = json['content_without_html'] as String?,
        isPublished = json['is_published'] as bool?,
        seoTitle = json['seo_title'],
        seoUrl = json['seo_url'],
        seoDescription = json['seo_description'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

}