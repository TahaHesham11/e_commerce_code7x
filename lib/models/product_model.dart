class ProductModel {
  final bool? success;
  final String? message;
  final DataModel? data;

  ProductModel({
    this.success,
    this.message,
    this.data,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? DataModel.fromJson(json['data'] as Map<String,dynamic>) : null;

}

class DataModel {
  final int? currentPage;
  late final  List<DataProduct>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;


  DataModel.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => DataProduct.fromJson(e as Map<String,dynamic>)).toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        links = (json['links'] as List?)?.map((dynamic e) => Links.fromJson(e as Map<String,dynamic>)).toList(),
        nextPageUrl = json['next_page_url'] as String?,
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;

}

class DataProduct {
 late final int? id;
  final String? name;
  final String? basePrice;
  final String? description;
  final String? descriptionWithoutHtml;
  final String? slug;
  final bool? hasVat;
  final dynamic brandId;
  final dynamic brand;
  final List<CategoriesByID>? categories;
  final List<dynamic>? tags;
  final int? ratersCount;
 late double rating;
  final int? totalOrders;
  final int? totalOrdersQuantity;
  final List<Images>? images;
  final String? coverImage;
  final String? coverImageThumbnail;
  final bool? isActive;
  final dynamic seoUrl;
  final dynamic seoTitle;
  final dynamic seoDescription;
  final String? createdAt;
  final String? updatedAt;
  late  bool isFavourite;
  final bool? userCanReview;
  final dynamic quantity;
  final List<dynamic>? variants;
  final bool? isDefault;
  final int? currentPrice;
  final String? price;
  final dynamic costPrice;
  final dynamic discountedPrice;
  final dynamic discountEndDate;
  final dynamic sku;
  final dynamic barcode;
  final dynamic weight;
  final dynamic weightUnitId;
  final dynamic dimensions;
  final dynamic maxUserQuantity;
  final dynamic minNotifyQuantity;
  final List<dynamic>? options;



  DataProduct.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        basePrice = json['base_price'] as String?,
        description = json['description'] as String?,
        descriptionWithoutHtml = json['description_without_html'] as String?,
        slug = json['slug'] as String?,
        hasVat = json['has_vat'] as bool?,
        brandId = json['brand_id'],
        brand = json['brand'],
        categories = (json['categories'] as List?)?.map((dynamic e) => CategoriesByID.fromJson(e as Map<String,dynamic>)).toList(),
        tags = json['tags'] as List?,
        ratersCount = json['raters_count'] as int?,
        rating = json['rating'] != null ? json['rating'].toDouble() : 0.0,
        totalOrders = json['total_orders'] as int?,
        totalOrdersQuantity = json['total_orders_quantity'] as int?,
        images = (json['images'] as List?)?.map((dynamic e) => Images.fromJson(e as Map<String,dynamic>)).toList(),
        coverImage = json['cover_image'] as String?,
        coverImageThumbnail = json['cover_image_thumbnail'] as String?,
        isActive = json['is_active'] as bool?,
        seoUrl = json['seo_url'],
        seoTitle = json['seo_title'],
        seoDescription = json['seo_description'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        isFavourite = json['isfavourite']??false,
        userCanReview = json['UserCanReview'] as bool?,
        quantity = json['quantity'],
        variants = json['variants'] as List?,
        isDefault = json['is_default'] as bool?,
        currentPrice = json['current_price'] as int?,
        price = json['price'] as String?,
        costPrice = json['cost_price'],
        discountedPrice = json['discounted_price'],
        discountEndDate = json['discount_end_date'],
        sku = json['sku'],
        barcode = json['barcode'],
        weight = json['weight'],
        weightUnitId = json['weight_unit_id'],
        dimensions = json['dimensions'],
        maxUserQuantity = json['max_user_quantity'],
        minNotifyQuantity = json['min_notify_quantity'],
        options = json['options'] as List?;


 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['id'] = this.id;
   data['name'] = this.name;
   data['base_price'] = this.basePrice;
   data['description'] = this.description;
   data['description_without_html'] = this.descriptionWithoutHtml;
   data['slug'] = this.slug;
   data['has_vat'] = this.hasVat;
   data['brand_id'] = this.brandId;
   data['brand'] = this.brand;
   if (this.categories != null) {
     data['categories'] = this.categories!.map((v) => v.toJson()).toList();
   }
   data['tags'] = this.tags;
   data['raters_count'] = this.ratersCount;
   data['rating'] = this.rating;
   data['total_orders'] = this.totalOrders;
   data['total_orders_quantity'] = this.totalOrdersQuantity;
   // if (images != null) {
   //   data['images'] = this.images!.map((v) => v.toJson()).toList();
   // }
   data['cover_image'] = this.coverImage;
   data['cover_image_thumbnail'] = this.coverImageThumbnail;
   data['is_active'] = this.isActive;
   data['seo_url'] = this.seoUrl;
   data['seo_title'] = this.seoTitle;
   data['seo_description'] = this.seoDescription;
   data['created_at'] = this.createdAt;
   data['updated_at'] = this.updatedAt;
   data['isfavourite'] = this.isFavourite;
   data['UserCanReview'] = this.userCanReview;
   data['quantity'] = this.quantity;
   data['variants'] = this.variants;
   data['is_default'] = this.isDefault;
   data['current_price'] = this.currentPrice;
   data['price'] = this.price;
   data['cost_price'] = this.costPrice;
   data['discounted_price'] = this.discountedPrice;
   data['discount_end_date'] = this.discountEndDate;
   data['sku'] = this.sku;
   data['barcode'] = this.barcode;
   data['weight'] = this.weight;
   data['weight_unit_id'] = this.weightUnitId;
   data['dimensions'] = this.dimensions;
   data['max_user_quantity'] = this.maxUserQuantity;
   data['min_notify_quantity'] = this.minNotifyQuantity;
   data['options'] = this.options;
   return data;
 }

}

class Brand {
  final int? id;
  final int? isActive;
  final String? name;
  final String? slug;
  final String? description;
  final String? image;
  final String? thumbnail;

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        isActive = json['is_active'] as int?,
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?,
        thumbnail = json['thumbnail'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'is_active' : isActive,
    'name' : name,
    'slug' : slug,
    'description' : description,
    'image' : image,
    'thumbnail' : thumbnail
  };
}

class CategoriesByID {
  late int id;
  final String? name;
  final String? description;
  late String slug;
  final dynamic parentId;
  final dynamic subCategories;
  final String? image;
  final dynamic thumbnail;
  final int? isActive;



  CategoriesByID.fromJson(Map<String, dynamic> json)
      : id = json['id'] ,
        name = json['name'] as String?,
        description = json['description'] as String?,
        slug = json['slug'],
        parentId = json['parent_id'],
        subCategories = json['sub_categories'],
        image = json['image'] as String?,
        thumbnail = json['thumbnail'],
        isActive = json['is_active'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'description' : description,
    'slug' : slug,
    'parent_id' : parentId,
    'sub_categories' : subCategories,
    'image' : image,
    'thumbnail' : thumbnail,
    'is_active' : isActive
  };
}

class Images {
  final int? id;
  final String? path;
  final String? thumbnail;
  final bool? cover;

  Images({
    this.id,
    this.path,
    this.thumbnail,
    this.cover,
  });

  Images.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        path = json['path'] as String?,
        thumbnail = json['thumbnail'] as String?,
        cover = json['cover'] as bool?;

}

class Links {
  final dynamic url;
  final String? label;
  final bool? active;

  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'] as String?,
        active = json['active'] as bool?;

}