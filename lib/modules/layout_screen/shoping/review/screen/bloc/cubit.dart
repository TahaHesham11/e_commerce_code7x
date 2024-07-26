import 'package:bloc/bloc.dart';
import 'package:e_commerce_code7x/models/review_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/review/screen/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/validate.dart';

class ReviewCubit extends Cubit<ReviewStates>{
  ReviewCubit() : super (ReviewInitialState());

  static ReviewCubit get(context)=>BlocProvider.of(context);


  ReviewModel? reviewModel;

  Future<void> getReview({required int id})async{

    emit(GetReviewLoadingState());
    try{

      final response = await DioHelper.getData(

          url: 'products/$id/reviews',
      token : token,
      );

      if(response.statusCode == 200){
        reviewModel = ReviewModel.fromJson(response.data);
        emit(GetReviewSuccessState());
      }
    }catch(e,p){
      print(e.toString());
      print(p.toString());
      emit(GetReviewErrorState());

    }

  }
}