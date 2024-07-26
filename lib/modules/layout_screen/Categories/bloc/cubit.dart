import 'package:bloc/bloc.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/categoryModel.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class CategoriesCubit extends Cubit<CategoriesStates>{
   CategoriesCubit() : super (CategoryInitialState());

   static CategoriesCubit get(context)=>BlocProvider.of(context);

   CategoryModel? categoryModel;


   Future<void> getCategories() async {
     emit(CategoriesLoadingState());
     try {
       final response = await DioHelper.getData(url: categories);
       if (response.statusCode == 200) {
         categoryModel = CategoryModel.fromJson(response.data);
         emit(CategoriesSuccessState());
         if (categoryModel!.data != null) {

           print(categoryModel!.data!.data.length);
         }
       }
     } catch (e, p) {
       print(e.toString());
       print(p.toString());
       emit(CategoriesErrorState());
     }
   }
 }