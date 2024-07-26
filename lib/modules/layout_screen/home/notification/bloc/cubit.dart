import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/notification_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/notification/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationStates>{
  NotificationCubit() : super (NotificationInitialState());

  static NotificationCubit get(context)=>BlocProvider.of(context);

  NotificationModel? notificationModel;

  Future<void> getNotification()async{
    emit(NotificationLoadingState());

  try{
    final response = await DioHelper.getData(url: notifications,token: token);

    if(response.statusCode == 200){
      notificationModel = NotificationModel.fromJson(response.data);
      emit(NotificationSuccessState());
      print(response.data);
    }
  }catch(e,p){
    print(e.toString());
    print(p.toString());

    emit(NotificationErrorState());
  }
  }
}