class PostAddressModel {
  bool? success;
  String? message;
 late Data data;


  PostAddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = (json['data'] != null ?  Data.fromJson(json['data']) : null)!;
  }

}

class Data {
  int? id;
  String? orderId;
  int? userId;
 late final int addressId;
 late final Address address;
  Null couponId;
 late final int paymentMethodId;
  String? status;
  String? subtotal;
  String? tax;
  String? shipping;
  String? discount;
  String? total;
  Null note;
  String? createdAt;
  String? updatedAt;
  Null cartReminderId;
  String? couponDiscount;
  String? offerDiscount;
  String? remainedCartDiscount;
  Null expectedDeliveryDate;
  String? translatedStatus;
  List<Items>? items;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    address =
    (json['address'] != null ?  Address.fromJson(json['address']) : null)!;
    couponId = json['coupon_id'];
    paymentMethodId = json['payment_method_id'];
    status = json['status'];
    subtotal = json['subtotal'];
    tax = json['tax'];
    shipping = json['shipping'];
    discount = json['discount'];
    total = json['total'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cartReminderId = json['cart_reminder_id'];
    couponDiscount = json['coupon_discount'];
    offerDiscount = json['offer_discount'];
    remainedCartDiscount = json['remained_cart_discount'];
    expectedDeliveryDate = json['expected_delivery_date'];
    translatedStatus = json['translated_status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add( Items.fromJson(v));
      });
    }
  }

}

class Address {
  int? id;
  String? title;
  String? address;
  bool? isDefault;
 late final String latitude;
 late final String longitude;
  int? cityId;
  int? regionId;
  Null districtId;



  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    isDefault = json['is_default'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    districtId = json['district_id'];
  }

}

class Items {
  int? id;
  int? orderId;
  int? productId;
  Null productVariantId;
  int? quantity;
  String? unitPrice;
  String? tax;
  String? createdAt;
  String? updatedAt;
  String? couponDiscount;
  String? offerDiscount;
  Product? product;
  Null productVariant;



  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    productVariantId = json['product_variant_id'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    tax = json['tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    couponDiscount = json['coupon_discount'];
    offerDiscount = json['offer_discount'];
    product =
    json['product'] != null ?  Product.fromJson(json['product']) : null;
    productVariant = json['product_variant'];
  }

}

class Product {
  int? id;
  String? name;
  String? basePrice;
  String? description;
  String? descriptionWithoutHtml;
  String? slug;
  bool? hasVat;
  Null brandId;
  Null brand;
  List<Categories>? categories;
  List<Null>? tags;
  int? rating;
  int? ratersCount;
  int? totalOrders;
  int? totalOrdersQuantity;
  List<Images>? images;
  String? coverImage;
  String? coverImageThumbnail;
  bool? isActive;
  Null seoUrl;
  Null seoTitle;
  Null seoDescription;
  String? createdAt;
  String? updatedAt;
  bool? isfavourite;
  bool? userCanReview;
  Null quantity;
  List<Null>? variants;
  bool? isDefault;
  int? currentPrice;
  String? price;

  List<Null>? options;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    basePrice = json['base_price'];
    description = json['description'];
    descriptionWithoutHtml = json['description_without_html'];
    slug = json['slug'];
    hasVat = json['has_vat'];
    brandId = json['brand_id'];
    brand = json['brand'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add( Categories.fromJson(v));
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
    isfavourite = json['isfavourite'];
    userCanReview = json['UserCanReview'];
    quantity = json['quantity'];
    isDefault = json['is_default'];
    currentPrice = json['current_price'];
    price = json['price'];

  }

}

class Categories {
  int? id;
  String? name;
  String? description;
  String? slug;
  int? parentId;
  int? isActive;



  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    parentId = json['parent_id'];

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
