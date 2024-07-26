import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/cart_model.dart';
import 'package:e_commerce_code7x/models/categoryModel.dart';
import 'package:e_commerce_code7x/models/change_favorite.dart';
import 'package:e_commerce_code7x/models/get_one_category.dart';
import 'package:e_commerce_code7x/models/product_model.dart';
import 'package:e_commerce_code7x/models/slider_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/get_favorite_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super (HomeInitialState());

  static HomeCubit get(context)=>BlocProvider.of(context);


SliderModel? sliderModel;



  Future<void> getSlider()async{
emit(HomeLoadingState());
    try{
     final response = await DioHelper.getData(
          url: sliders
      );
     if(response.statusCode == 200){
       sliderModel = SliderModel.fromJson(response.data);
       emit(HomeSuccessState());

     }
     else{
       emit(HomeErrorState());

     }

    }
    catch(e ){
      emit(HomeErrorState());
    }
  }



 ProductModel? productModel;


 Future<void> getProduct() async {

   emit(ProductLoadingState());

   try {
     final response = await DioHelper.getData(
         url: products,
         token: token,
     );

     if (response.statusCode == 200) {
     productModel = ProductModel.fromJson(response.data);
       emit(ProductSuccessState());
       print(productModel!.message);

     }
   } catch (e,p ) {
     debugPrint(p.toString());
     debugPrint(e.toString());
     emit(ProductErrorState());
   }
 }


 CategoryModel? categoryModel;
  DataCategory? dataCategory;
  SubCategory? subCategory;

  Future<void> getCategory() async {
    emit(CategoryLoadingState());
    try {
      final response = await DioHelper.getData(url: categories);

      if (response.statusCode == 200) {
        categoryModel = CategoryModel.fromJson(response.data);
        emit(CategorySuccessState());

      }
    } catch (e ) {

      emit(CategoryErrorState());
    }
  }

  GetOneCategories? getOneCategories;

  Future<void> getOneCategory({required int categoryId}) async {
    emit(GetOneCategoryLoadingState());
    try {
      final response = await DioHelper.getData(
          url: 'categories/$categoryId',
          token: token);
      if (response.statusCode == 200) {
        getOneCategories = GetOneCategories.fromJson(response.data);
        emit(GetOneCategorySuccessState());

      }
    } catch (e ,p) {
      debugPrint(e.toString());
      debugPrint(p.toString());
      emit(GetOneCategoryErrorState());
    }
  }




  ChangeFavoriteModel? changeFavoriteModel;

 Future<void> changeFavorite({required int id,context})async{
   try{
     final response = await DioHelper.postData(
         url: 'products/$id/favorites',
       token: token
     );

     if(response.statusCode == 200){
       emit(ChangeFavoriteSuccessState());

       getFavorite(isLoading: false);
     }
     else{
       emit(ChangeFavoriteErrorState());

     }
   }catch(e,p){
     showToastStates(text: e.toString(), state: ToastStates.ERROR);
     debugPrint('zzzzzzzzzzzzzzzzzzzzzzzzzzz----------------------->>>>${e.toString()}');

     debugPrint('zzzzzzzzzzzzzzzzzzzzzzzzzzz----------------------->>>>${p.toString()}');
     emit(ChangeFavoriteErrorState());

   }
 }


  GetFavoriteModel? getFavoriteModel;
  Future<void> getFavorite({bool isLoading=true})async{
if(isLoading) {
  emit(FavoriteLoadingState());
}
    try{
      final response = await DioHelper.getData(
        url: getFavorites ,
        token: token,
      );

      if(response.statusCode == 200){

        getFavoriteModel = GetFavoriteModel.fromJson(response.data);
        emit(FavoriteSuccessState());

      }
    }catch(e,p){
      emit(FavoriteErrorState());
      print(e.toString());
      print(p.toString());

    }
  }

  CartModel? cartModel;
  void sendCart({
    required int productId,
    required int quantity,
  })async{

    emit(SendOrderLoadingState());

    try{

      final response = await DioHelper.postData(
          url: cart,
         token: token,
          data: {
            'product_id': productId,
            'quantity' : quantity,
          }
      );

      if(response.statusCode == 200) {


        emit(SendOrderSuccessState());


      }
    }catch(e,p){

      debugPrint(e.toString());
      debugPrint(p.toString());
      emit(SendOrderErrorState());
    }
  }




 Future<void> fetchFilterPrice() async {
   emit(FilterPriceLoadingState());

   try {
     final response = await DioHelper.getData(
       url: filterPrice,
       token: token,
      query : {
         'filter[price]': '-1111,900'}, // إضافة المعلمة لتصفية البيانات بالسعر
     );
     if (response.statusCode == 200) {
       // قم بتحويل البيانات المستلمة إلى قائمة من نوع DataProduct

       // ترتيب البيانات حسب السعر من الأعلى إلى الأقل


       emit(FilterPriceSuccessState());
     }
   } catch (e, p) {
     debugPrint(e.toString());
     debugPrint(p.toString());
     emit(FilterPriceErrorState());
   }
 }


  List<DataProduct>? bestSellerList ;

ProductModel? bestSellerProduct;
  Future<void> filterBestProduct() async {
    emit(FilterBestProductLoadingState());
    try {
      final response = await DioHelper.getData(
        url: filterProduct,
        query: {
          'sort': 'total_orders',
        },
      );

      if (response.statusCode == 200) {


        bestSellerProduct = ProductModel.fromJson(response.data);

        if (bestSellerProduct != null) {

          bestSellerList = bestSellerProduct!.data!.data!;
          print('Data products list: ${bestSellerList.toString()}');
          emit(FilterBestProductSuccessState());
        }
      }
    } catch (e, p) {
      debugPrint('Error: $e');
      debugPrint('Stack Trace: $p');
      emit(FilterBestProductErrorState());
    }
  }






  List<DataProduct>? discountProductsLis ;

  ProductModel? discountModel;

  void filterDiscount()async{

    emit(FilterDiscountLoadingState());
    try{
      final response = await DioHelper.getData(
        url: products,
        query: {
          'filter[discounted]':'true'
        },
        token: token,
      );

      if(response.statusCode == 200) {
        discountModel = ProductModel.fromJson(response.data);


        discountProductsLis = discountModel!.data!.data!;

        emit(FilterDiscountSuccessState());
        print('AAAAAAAAAAAAAAAAAAAAAAAAAA-----------------------------------ZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
        print('Data products list: ${discountProductsLis.toString()}');

      }
    }catch(e,p){
      debugPrint(e.toString());
      debugPrint(p.toString());
      emit(FilterDiscountErrorState());
    }
  }



  void postRating({required int id,required double rating})async{
    emit(PostRatingLoadingState());
    try{
      final response = await DioHelper.postData(
          url: 'products/$id/reviews',
        token: token,
        data: {
            'rating':rating
        }
      );

      if(response.statusCode == 200){
        emit(PostRatingSuccessState());
      }

    }catch(e,p){
      debugPrint(e.toString());
      debugPrint(p.toString());
      emit(PostRatingErrorState());
    }
  }



  
   
  ProductModel? latestModel;
  Future<void> getProductsByCreationDate() async {

    emit(GetProductsByCreationDateLoadingState());
    try{
      final response = await DioHelper.getData(url: products,token: token);

      if(response.statusCode == 200){
        latestModel = ProductModel.fromJson(response.data);

        latestModel!.data!.data!.sort((a, b) {
          DateTime dateA = DateTime.parse(a.createdAt!);
          DateTime dateB = DateTime.parse(b.createdAt!);
          return  dateB.compareTo(dateA);
        });

        emit(GetProductsByCreationDateSuccessState());

      }
    }catch(e,p){
      print(e.toString());
      print(p.toString());

      emit(GetProductsByCreationDateErrorState());
      
    }


  }




  // Future<void> getCategoryIdInProduct({ required int catsId}) async {
  //   emit(GetProductsByCategoryLoadingState());
  //   try {
  //     final response = await DioHelper.getData(
  //       url: 'products',
  //       token: token,
  //       query: {
  //         'filter[cats_id]': catsId,
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final productModel = ProductModel.fromJson(response.data);
  //
  //       if (productModel.data != null && productModel.data!.data != null) {
  //         categoryData = productModel.data!.data!
  //             .expand((product) => product.categories ?? [])
  //             .map((category) => CategoriesByID.fromJson(category.toJson()))
  //             .toList();
  //         print(categoryData![0].id);
  //
  //         emit(GetProductsByCategorySuccessState());
  //       }
  //     }
  //   } catch (e, p) {
  //     print(e.toString());
  //     print(p.toString());
  //     emit(GetProductsByCategoryErrorState());
  //   }
  // }



  ProductModel? similarModel;
  List<DataProduct>? similarList;

  Future<void> getCategoryIdInProduct({required int catsId}) async {
  emit(GetProductsByCategoryLoadingState());
  try {
    final response = await DioHelper.getData(
      url: products,
      token: token,
      query: {
        'filter[cats_id]': catsId,
      },
    );

    if (response.statusCode == 200) {

      similarModel =ProductModel.fromJson(response.data);

      similarList = similarModel!.data!.data!;


      emit(GetProductsByCategorySuccessState());

    }

  } catch (e, p) {
debugPrint(e.toString());
debugPrint(p.toString());
emit(GetProductsByCategoryErrorState());

}
  }

  late String searchName = '';
  double lowerValue = 0;
  double upperValue = 2000;

  var formKey = GlobalKey<FormState>();


  final searchController = TextEditingController();


  ProductModel? filterSearchProduct;
  List<DataProduct>? filterSearchProductList;
  Future<void> getFilterSearchProduct({
    required String name,
    required double priceMin,
    required double priceMax
  }) async {
    emit(FilterSearchProductLoadingState());
    try {
      final response = await DioHelper.getData(
        url: productsLimit,
        token: token,
        query: {
          'filter[name]': name,
          'filter[price]': '$priceMin,$priceMax'
        },
      );

      if (response.statusCode == 200) {
        filterSearchProduct = ProductModel.fromJson(response.data);
        filterSearchProductList = filterSearchProduct!.data!.data;
        print('Filtered Products: ${filterSearchProductList!.length}'); // Print to check the length of filtered products
        emit(FilterSearchProductSuccessState());
      }
    } catch (e, p) {
      debugPrint(e.toString());
      debugPrint(p.toString());
      emit(FilterSearchProductErrorState());
    }
  }




  // List<DataProduct>? ProductsLis;
  //
  // Future<void> fetchFilterCats({required int id}) async {
  //   emit(FilterCategoryLoadingState());
  //   try {
  //     final response = await DioHelper.getData(
  //       url: products,
  //       query: {'filter[cats_id]': '$id'},
  //     );
  //     if (response.statusCode == 200) {
  //       final List<DataProduct> allProducts = productModel!.data!.data!;
  //
  //       ProductsLis = allProducts.where((product) => product.id == id).toList();
  //
  //
  //       print('999999999999999//////////////--------------------------------///////////////////////////');
  //       print(ProductsLis);
  //       emit(FilterCategorySuccessState());
  //     }
  //   } catch (e, p) {
  //     print(e.toString());
  //     print(p.toString());
  //     emit(FilterCategoryErrorState());
  //   }
  // }










}