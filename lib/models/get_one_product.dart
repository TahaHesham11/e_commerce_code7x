class GetOneProduct {
  bool? success;
  String? message;
  Data? data;


  GetOneProduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? id;
  String? name;
  String? basePrice;
  String? description;
  String? descriptionWithoutHtml;
  String? slug;
  bool? hasVat;
  int? brandId;
  Brand? brand;
  List<CategoriesById>? categories;
  List<Null>? tags;
  double? rating;
  int? ratersCount;
  int? totalOrders;
  int? totalOrdersQuantity;
  List<Images>? images;
  String? coverImage;
  String? coverImageThumbnail;
  bool? isActive;
  Null? seoUrl;
  Null? seoTitle;
  Null? seoDescription;
  String? createdAt;
  String? updatedAt;
  FirstOption? firstOption;
  List<Variants>? variants;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    basePrice = json['base_price'];
    description = json['description'];
    descriptionWithoutHtml = json['description_without_html'];
    slug = json['slug'];
    hasVat = json['has_vat'];
    brandId = json['brand_id'];
    brand = json['brand'] != null ?  Brand.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      categories = <CategoriesById>[];
      json['categories'].forEach((v) {
        categories!.add( CategoriesById.fromJson(v));
      });
    }
    rating = json['rating'];
    ratersCount = json['raters_count'];
    totalOrders = json['total_orders'];
    totalOrdersQuantity = json['total_orders_quantity'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add( Images.fromJson(v));
      });
    }
    coverImage = json['cover_image'];
    coverImageThumbnail = json['cover_image_thumbnail'];
    isActive = json['is_active'];
    seoUrl = json['seo_url'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstOption = json['first_option'] != null
        ? new FirstOption.fromJson(json['first_option'])
        : null;
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add( Variants.fromJson(v));
      });
    }
  }

}

class Brand {
  int? id;
  int? isActive;
  String? name;
  String? slug;
  String? description;
  String? image;
  String? thumbnail;



  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['is_active'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    image = json['image'];
    thumbnail = json['thumbnail'];
  }

}

class CategoriesById {
 late int id;
  String? name;
  String? description;
  String? slug;
  Null parentId;
  Null subCategories;
  Null image;
  Null thumbnail;
  int? isActive;



  CategoriesById.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    parentId = json['parent_id'];
    subCategories = json['sub_categories'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    isActive = json['is_active'];
  }


}

class Images {
  int? id;
  String? path;
  String? thumbnail;
  bool? cover;


  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    thumbnail = json['thumbnail'];
    cover = json['cover'];
  }

}

class FirstOption {
  int? id;
  String? value;
  int? isColor;
  List<Values>? values;


  FirstOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    isColor = json['is_color'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add( Values.fromJson(v));
      });
    }
  }

}

class Values {
  int? id;
  String? value;
  Null color;


  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    color = json['color'];
  }

}

class Variants {
  int? id;
  bool? isDefault;
  int? currentPrice;
  String? price;
  Null? quantity;
  Null? costPrice;
  String? discountedPrice;
  Null? discountEndDate;
  Null? sku;
  Null? barcode;
  Null? weight;
  Null? weightUnitId;
  Null? dimensions;
  int? maxUserQuantity;
  Null? minNotifyQuantity;
  List<Options>? options;



  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isDefault = json['is_default'];
    currentPrice = json['current_price'];
    price = json['price'];
    quantity = json['quantity'];
    costPrice = json['cost_price'];
    discountedPrice = json['discounted_price'];
    discountEndDate = json['discount_end_date'];
    sku = json['sku'];
    barcode = json['barcode'];
    weight = json['weight'];
    weightUnitId = json['weight_unit_id'];
    dimensions = json['dimensions'];
    maxUserQuantity = json['max_user_quantity'];
    minNotifyQuantity = json['min_notify_quantity'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

}

class Options {
  String? value;
  Null? color;
  String? option;
  int? optionId;
  int? valueId;


  Options.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    color = json['color'];
    option = json['option'];
    optionId = json['option_id'];
    valueId = json['value_id'];
  }


}
