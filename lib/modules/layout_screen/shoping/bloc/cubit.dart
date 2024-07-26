import 'package:dio/dio.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/address_model.dart';
import 'package:e_commerce_code7x/models/cart_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCubit extends Cubit<ShoppingStates>{
  ShoppingCubit() : super(ShoppingInitialState());

  static ShoppingCubit get(context)=>BlocProvider.of(context);

  final messageController  = TextEditingController();
  final dateController  = TextEditingController();
  final codeController  = TextEditingController();

  final formKey = GlobalKey<FormState>();

 CartModel? cartModel;

 Future<void> getCartProduct() async {
   emit(ShoppingLoadingState());

   try {
     final response = await DioHelper.getData(url: cart,token: token);
     if (response.statusCode == 200) {
       cartModel = CartModel.fromJson(response.data);
       emit(ShoppingSuccessState());
       if (cartModel!.data != null) {
         print(cartModel!.data!);
       }
     }
   } catch (e, p) {
     print(e.toString());
     print(p.toString());
     emit(ShoppingErrorState());
   }
 }


 Future<void> deleteCartItem({required int id})async{
   emit(DeleteCartLoadingState());

try{
  final response =await DioHelper.deleteData(
    url: 'cart/$id',
    token: token

  );
  if(response.statusCode == 200){
    emit(DeleteCartSuccessState());
    getCartProduct();
  }

}catch(e,p){
  print(e.toString());
  print(p.toString());
  emit(DeleteCartErrorState());
}

 }






  // Future<void> postCode()async{
  //
  //   emit(PostCodeLoadingState());
  //
  //   try{
  //     final response = await DioHelper.postData(
  //         url: applyCoupon,
  //       data: {
  //           "coupon":codeController.text,
  //       }
  //
  //     );
  //     if(response.statusCode == 200){
  //       emit(PostCodeSuccessState());
  //     }
  //   }catch(e,p){
  //     debugPrint(e.toString());
  //     debugPrint(p.toString());
  //     emit(PostCodeErrorState());
  //   }
  //
  // }



}