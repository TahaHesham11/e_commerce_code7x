import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/orders_model.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderStates>{
  OrderCubit() : super (OrderInitialState());
  
  
  static OrderCubit get(context) => BlocProvider.of(context);


  OrdersModel? ordersModel;
  Future<void> getOrder()async{
    emit(OrderLoadingState());
    
    try{
      
      final response = await DioHelper.getData(url: orders,token: token);

      if(response.statusCode == 200){

        ordersModel = OrdersModel.fromJson(response.data);


        emit(OrderSuccessState());

      }

    }catch(e,p){
      print(e.toString());
      print(p.toString());
      print(OrderErrorState());
    }
  }
}