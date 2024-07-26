class OrdersModel {
  final bool? success;
  final String? message;
  final Data? data;

  OrdersModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

}

class Data {
  final int? currentPage;
  final List<OrderData>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;


  Data.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => OrderData.fromJson(e as Map<String,dynamic>)).toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        links = (json['links'] as List?)?.map((dynamic e) => Links.fromJson(e as Map<String,dynamic>)).toList(),
        nextPageUrl = json['next_page_url'],
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;

}

class OrderData {
  final int? id;
  final String? orderId;
  final int? userId;
  final int? addressId;
  final Address? address;
  final dynamic couponId;
  final int? paymentMethodId;
  final String? status;
  final String? subtotal;
  final String? tax;
  final String? shipping;
  final String? discount;
  final String? total;
  final String? note;
  final String? createdAt;
  final String? updatedAt;
  final dynamic cartReminderId;
  final String? couponDiscount;
  final String? offerDiscount;
  final String? remainedCartDiscount;
  final String? expectedDeliveryDate;
  final String? translatedStatus;
  final List<Items>? items;



  OrderData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        orderId = json['order_id'] as String?,
        userId = json['user_id'] as int?,
        addressId = json['address_id'] as int?,
        address = (json['address'] as Map<String,dynamic>?) != null ? Address.fromJson(json['address'] as Map<String,dynamic>) : null,
        couponId = json['coupon_id'],
        paymentMethodId = json['payment_method_id'] as int?,
        status = json['status'] as String?,
        subtotal = json['subtotal'] as String?,
        tax = json['tax'] as String?,
        shipping = json['shipping'] as String?,
        discount = json['discount'] as String?,
        total = json['total'] as String?,
        note = json['note'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        cartReminderId = json['cart_reminder_id'],
        couponDiscount = json['coupon_discount'] as String?,
        offerDiscount = json['offer_discount'] as String?,
        remainedCartDiscount = json['remained_cart_discount'] as String?,
        expectedDeliveryDate = json['expected_delivery_date'] as String?,
        translatedStatus = json['translated_status'] as String?,
        items = (json['items'] as List?)?.map((dynamic e) => Items.fromJson(e as Map<String,dynamic>)).toList();

}

class Address {
  final int? id;
  final String? title;
  final String? address;
  final bool? isDefault;
  final String? latitude;
  final String? longitude;
  final int? cityId;
  final int? regionId;
  final dynamic districtId;


  Address.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        address = json['address'] as String?,
        isDefault = json['is_default'] as bool?,
        latitude = json['latitude'] as String?,
        longitude = json['longitude'] as String?,
        cityId = json['city_id'] as int?,
        regionId = json['region_id'] as int?,
        districtId = json['district_id'];

}

class Items {
  final int? id;
  final int? orderId;
  final int? productId;
  final dynamic productVariantId;
  final int? quantity;
  final String? unitPrice;
  final String? tax;
  final String? createdAt;
  final String? updatedAt;
  final String? couponDiscount;
  final String? offerDiscount;
  final Product? product;
  final dynamic productVariant;


  Items.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        orderId = json['order_id'] as int?,
        productId = json['product_id'] as int?,
        productVariantId = json['product_variant_id'],
        quantity = json['quantity'] as int?,
        unitPrice = json['unit_price'] as String?,
        tax = json['tax'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        couponDiscount = json['coupon_discount'] as String?,
        offerDiscount = json['offer_discount'] as String?,
        product = (json['product'] as Map<String,dynamic>?) != null ? Product.fromJson(json['product'] as Map<String,dynamic>) : null,
        productVariant = json['product_variant'];

}

class Product {
  final int? id;
  final String? name;
  final String? basePrice;
  final String? description;
  final String? descriptionWithoutHtml;
  final String? slug;
  final bool? hasVat;
  final int? brandId;
  final dynamic brand;
  final List<Categories>? categories;
  final List<dynamic>? tags;
  late double rating;
  final int? ratersCount;
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
  final bool? isfavourite;
  final bool? userCanReview;
  final dynamic quantity;
  final List<dynamic>? variants;
  final bool? isDefault;
  final int? currentPrice;
  final String? price;
  final dynamic costPrice;
  final String? discountedPrice;
  final String? discountEndDate;
  final dynamic sku;
  final dynamic barcode;
  final dynamic weight;
  final dynamic weightUnitId;
  final dynamic dimensions;
  final dynamic maxUserQuantity;
  final dynamic minNotifyQuantity;
  final List<dynamic>? options;


  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        basePrice = json['base_price'] as String?,
        description = json['description'] as String?,
        descriptionWithoutHtml = json['description_without_html'] as String?,
        slug = json['slug'] as String?,
        hasVat = json['has_vat'] as bool?,
        brandId = json['brand_id'] as int?,
        brand = json['brand'],
        categories = (json['categories'] as List?)?.map((dynamic e) => Categories.fromJson(e as Map<String,dynamic>)).toList(),
        tags = json['tags'] as List?,
        rating = json['rating'] != null ? json['rating'].toDouble() : 0.0,
        ratersCount = json['raters_count'] as int?,
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
        isfavourite = json['isfavourite'] as bool?,
        userCanReview = json['UserCanReview'] as bool?,
        quantity = json['quantity'],
        variants = json['variants'] as List?,
        isDefault = json['is_default'] as bool?,
        currentPrice = json['current_price'] as int?,
        price = json['price'] as String?,
        costPrice = json['cost_price'],
        discountedPrice = json['discounted_price'] as String?,
        discountEndDate = json['discount_end_date'] as String?,
        sku = json['sku'],
        barcode = json['barcode'],
        weight = json['weight'],
        weightUnitId = json['weight_unit_id'],
        dimensions = json['dimensions'],
        maxUserQuantity = json['max_user_quantity'],
        minNotifyQuantity = json['min_notify_quantity'],
        options = json['options'] as List?;

}

class Categories {
  final int? id;
  final String? name;
  final String? description;
  final String? slug;
  final int? parentId;
  final dynamic subCategories;
  final dynamic image;
  final dynamic thumbnail;
  final int? isActive;


  Categories.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        slug = json['slug'] as String?,
        parentId = json['parent_id'] as int?,
        subCategories = json['sub_categories'],
        image = json['image'],
        thumbnail = json['thumbnail'],
        isActive = json['is_active'] as int?;

}

class Images {
  final int? id;
  final String? path;
  final String? thumbnail;
  final bool? cover;



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


  Links.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'] as String?,
        active = json['active'] as bool?;


}