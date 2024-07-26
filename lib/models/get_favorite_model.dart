class GetFavoriteModel {
 late final bool? success;
 late final String? message;
  late final Data? data;


 GetFavoriteModel.fromJson(Map<String, dynamic> json) {
   success = json['success'];
   message = json['message'];
   data = json['data'] != null ?  Data.fromJson(json['data']) : null;
 }

}

class Data {
 late final int? currentPage;
 late final List<Datum>? data;
 late final String? firstPageUrl;
 late final int? from;
 late final int? lastPage;
 late final String? lastPageUrl;
 late final List<Link>? links;
 late final dynamic nextPageUrl;
 late final String? path;
 late final int? perPage;
 late final dynamic prevPageUrl;
 late final int? to;
 late final int? total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Datum>[];
      json['data'].forEach((v) {
        data!.add( Datum.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }


}

class Datum {
 late final int? id;
 late final int? userId;
 late final int? productId;
 late final String createdAt;
 late final String updatedAt;
 late final ProductData? product;


  Datum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    createdAt = json['created_at']as String;
    updatedAt = json['updated_at']as String;
    product = json['product'] != null ?  ProductData.fromJson(json['product']) : null;
  }
}

class ProductData {
late final int? id;
late final String? name;
late final String? basePrice;
late final String? description;
late final String? descriptionWithoutHtml;
late final String? slug;
late final bool? hasVat;
late final int? brandId;
late final Brand? brand;
late final List<Brand>? categories;
late final List<dynamic>? tags;
late final int? ratersCount;
late double rating;
late final int? totalOrders;
late final int? totalOrdersQuantity;
late final List<Images>? images;
late final String? coverImage;
late final String? coverImageThumbnail;
late final bool? isActive;
late final dynamic seoUrl;
late final dynamic seoTitle;
late final dynamic seoDescription;
late final String? createdAt;
late final String? updatedAt;
  bool? isFavourite;
late final bool? userCanReview;
late final List<Variant>? variants;
late final dynamic quantity;
late final bool? isDefault;
late final int? currentPrice;
late final String? price;
late final dynamic costPrice;
late final String? discountedPrice;
late final dynamic discountEndDate;
late final dynamic sku;
late final dynamic barcode;
late final dynamic weight;
late final dynamic weightUnitId;
late final dynamic dimensions;
late final dynamic maxUserQuantity;
late final dynamic minNotifyQuantity;
late final List<dynamic>? options;

ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    basePrice = json['base_price'];
    description = json['description'];
    discountedPrice = json['discounted_price'];
    descriptionWithoutHtml = json['description_without_html'];
    slug = json['slug'];
    hasVat = json['has_vat'];
    brandId = json['brand_id'];
    ratersCount = json['raters_count'];
    rating = json['rating'] != null ? json['rating'].toDouble() : 0.0;
  totalOrders = json['total_orders'];
    totalOrdersQuantity = json['total_orders_quantity'];
    coverImage = json['cover_image'];
    coverImageThumbnail = json['cover_image_thumbnail'];
    isActive = json['is_active'];
    seoUrl = json['seo_url'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFavourite = json['isfavourite'];
    userCanReview = json['UserCanReview'];
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
  final dynamic parentId;
  final dynamic subCategories;

  Brand({
    this.id,
    this.isActive,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.thumbnail,
    this.parentId,
    this.subCategories,
  });

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

}

class Variant {
  final int? id;
  final bool? isDefault;
  final int? currentPrice;
  final String? price;
  final int? quantity;
  final String? costPrice;
  final String? discountedPrice;
  final dynamic discountEndDate;
  final String? sku;
  final String? barcode;
  final String? weight;
  final dynamic weightUnitId;
  final dynamic dimensions;
  final int? maxUserQuantity;
  final dynamic minNotifyQuantity;
  final List<Option>? options;

  Variant({
    this.id,
    this.isDefault,
    this.currentPrice,
    this.price,
    this.quantity,
    this.costPrice,
    this.discountedPrice,
    this.discountEndDate,
    this.sku,
    this.barcode,
    this.weight,
    this.weightUnitId,
    this.dimensions,
    this.maxUserQuantity,
    this.minNotifyQuantity,
    this.options,
  });

}

class Option {
  final String? value;
  final String? color;
  final String? option;
  final int? optionId;
  final int? valueId;

  Option({
    this.value,
    this.color,
    this.option,
    this.optionId,
    this.valueId,
  });

}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

}
