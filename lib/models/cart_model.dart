class CartModel {
  final bool? success;
  final String? message;
  final DataCart? data;


  CartModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as bool?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? DataCart.fromJson(json['data'] as Map<String,dynamic>) : null;

}

class DataCart {
 late int total;
 late int subTotal;
 late int totalDiscount;
 late int offerDiscount;
 late int couponDiscount;
 late int remainedCartDiscount;
 late int vat;
 late int totalItems;
 late int totalItemsQuantity;
 late int shipping;
 late List<Items> items;
 late List<dynamic> offers;
 late dynamic coupon;
 late dynamic remainedCart;


 DataCart.fromJson(Map<String, dynamic> json){
    total = json['total'];
    subTotal = json['sub_total'];
    totalDiscount = json['total_discount'] ;
    offerDiscount = json['offer_discount'] ;
    couponDiscount = json['coupon_discount'];
    remainedCartDiscount = json['remained_cart_discount'] ;
    vat = json['vat'] ;
    totalItems = json['total_items'];
    totalItemsQuantity = json['total_items_quantity'];
    shipping = json['shipping'] ;

    items = (json['items'] as List).map((dynamic e) =>
    Items.fromJson(e as Map<String,dynamic>)).toList();
    offers = json['offers'] ;
    coupon = json['coupon'];
    remainedCart = json['remained_cart'];
  }

}

class Items {
  late int id;
  final int? productId;
  final dynamic variantId;
  final bool? outOfStock;
  final bool? maxUserQuantityReached;
  final String? name;
  final String? coverImage;
  final String? coverImageThumbnail;
  late int quantity;
  final int? originalUnitPrice;
    int? totalPrice;
  final int? finalUnitPrice;
  final int? totalOffersDiscount;
  final dynamic couponDiscount;
  final int? quantityUsedInXOffers;
  final bool? couponActive;
  final List<dynamic>? offers;
  final Item? item;

  Items.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        productId = json['product_id'] as int?,
        variantId = json['variant_id'],
        outOfStock = json['out_of_stock'] as bool?,
        maxUserQuantityReached = json['max_user_quantity_reached'] as bool?,
        name = json['name'] as String?,
        coverImage = json['cover_image'] as String?,
        coverImageThumbnail = json['cover_image_thumbnail'] as String?,
        quantity = json['quantity'] as int,
        originalUnitPrice = json['original_unit_price'] as int?,
        totalPrice = json['total_price'] as int?,
        finalUnitPrice = json['final_unit_price'] as int?,
        totalOffersDiscount = json['total_offers_discount'] as int?,
        couponDiscount = json['coupon_discount'],
        quantityUsedInXOffers = json['quantity_used_in_x_offers'] as int?,
        couponActive = json['coupon_active'] as bool?,
        offers = json['offers'] as List?,
        item = (json['item'] as Map<String,dynamic>?) != null ? Item.fromJson(json['item'] as Map<String,dynamic>) : null;

}

class Item {
  final int? id;
  final int? userId;
  final int? productId;
  final dynamic productVariantId;
  final int? quantity;
  final String? createdAt;
  final String? updatedAt;
  final int? price;
  final Product? product;
  final dynamic variant;


  Item.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        productId = json['product_id'] as int?,
        productVariantId = json['product_variant_id'],
        quantity = json['quantity'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        price = json['price'] as int?,
        product = (json['product'] as Map<String,dynamic>?) != null ? Product.fromJson(json['product'] as Map<String,dynamic>) : null,
        variant = json['variant'];

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
  final dynamic rating;
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
        rating = json['rating'] ,
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