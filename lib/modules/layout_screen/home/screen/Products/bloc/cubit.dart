import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/screen/Products/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../models/product_model.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super (SearchInitialState());

  static SearchCubit get(context)=>BlocProvider.of(context);
  ProductModel? productModel;

  Future<void> getAllProduct()async{

    emit(GetAllProductLoadingState());
    try{
      final response = await DioHelper.getData(
          token: token,
          url:  productsLimit);


      if(response.statusCode ==200){
        productModel = ProductModel.fromJson(response.data);
      }

      emit(GetAllProductSuccessState());

    }catch(e,p){
      debugPrint('zzzzzzzzzzzzzzzzzzzzzzzzzzz----------------------->>>>${e.toString()}');

      debugPrint('zzzzzzzzzzzzzzzzzzzzzzzzzzz----------------------->>>>${p.toString()}');
      emit(GetAllProductErrorState());
    }
  }

  final searchController = TextEditingController();

  List<DataProduct>? dataProductsLis ;

  List<DataProduct> dataProductsList = [];

  Future<void> getSearch({required String name}) async {
    emit(GetSearchLoadingState());

    try {
      final response = await DioHelper.getData(
        url: 'products',
        token: token,
        query: {'filter[name]': name},
      );

      if (response.statusCode == 200) {
        // Parse the product model from response
        productModel = ProductModel.fromJson(response.data);
        dataProductsList = productModel!.data!.data!;
        emit(GetSearchSuccessState(dataProductsLis));
      }
    } catch (e, p) {
      print(e.toString());
      print(p.toString());
      emit(GetSearchErrorState());
    }
  }

}