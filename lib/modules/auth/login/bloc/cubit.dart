import 'package:dio/dio.dart';
import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/sign_model.dart';
import 'package:e_commerce_code7x/models/verifiy_login.dart';
import 'package:e_commerce_code7x/modules/auth/login/bloc/states.dart';
import 'package:e_commerce_code7x/modules/auth/login/components/show_dialog.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  // void userLogin({
  //   required String phone,
  //
  // }){
  //   emit(LoginLoadingState());
  //   DioHelper.postData(
  //       url: login,
  //       data: {
  //         'phone':phone,
  //       }).then((value) {
  //
  //     print(value.data);
  //     loginModel = LoginModel.fromJson(value.data);
  //
  //     emit(LoginSuccessState(loginModel!));
  //   }).catchError((error){
  //     emit(LoginErrorState(error.toString()));
  //   });
  // }

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final loginOTPController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Login? loginModel;

  Future<void> userLogin(BuildContext context) async {
    emit(LoginLoadingState());
    try {
      final response = await DioHelper.postData(url: login, data: {
        'phone': phoneController.text,
      });
      debugPrint("=========================");
      debugPrint(response.toString());
      debugPrint("=========================");

      loginModel = Login.fromJson(response.data);

      if (loginModel!.success) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              loginOTPController: loginOTPController,
              onConfirm: () {
                if (formKey.currentState!.validate()) {
                  verifyLogin(context);
                }
              },
            );
          },
        );
        emit(LoginSuccessState(msg: loginModel!.message));
      } else {
        emit(LoginErrorState(msg: loginModel!.message));
        print('--------------///////////////////-----------------');
        print(loginModel!.message.toString());
      }
    } on DioError catch (e) {
      debugPrint("Dio error: ${e.message}");
      emit(LoginErrorState(msg: "Dio error: ${loginModel!.message}"));
    } catch (e, p) {
      debugPrint("Error: $e");
      emit(LoginErrorState(msg: loginModel!.message));
    }
  }

  //
  // Future<void> verifyLogin(context) async {
  //   emit(VerifyLoadingState());
  //   try {
  //    final response =  await DioHelper.postData(
  //         url: verifyLoginOTP,
  //         data: {
  //           'phone' : phoneController.text,
  //           'otp': loginOTPController.text,
  //         }
  //     );
  //    print('-----////////////----------------------');
  //
  //     if (verifiyLogin!.success) {
  //       verifiyLogin = VerifiyModel.fromJson(response.data);
  //       navigateAndFinish(context, const LayoutScreen());
  //       emit(VerifySuccessState());
  //     }
  //   } catch (e, path) {
  //     debugPrint(path.toString());
  //     emit(VerifyErrorState(msg:verifiyLogin!.message));
  //   }
  // }

  VerifyModel? verifiyLogin;

  Future<void> verifyLogin(context) async {
    emit(VerifyLoadingState());
    try {
      final response = await DioHelper.postData(
        url: verifyLoginOTP,
        data: {
          'phone': phoneController.text,
          'otp': loginOTPController.text,
        },
      );
      print('ppppp///////////////////----------------------///////////////');

      verifiyLogin = VerifyModel.fromJson(response.data);

      if (response.statusCode == 200) {
        print(
            'zzzzzzzzzzzzzzzzz///////////////////----------------------///////////////');
        emit(VerifySuccessState(msg: verifiyLogin!.message,));

        print(verifiyLogin!.message);
      }

      CacheHelper.saveData(key: 'token', value: verifiyLogin!.data?.token);

      navigateAndFinish(context, const LayoutScreen());
    } catch (e, path) {
      debugPrint(path.toString());
      debugPrint(e.toString());
      emit(VerifyErrorState(msg: verifiyLogin!.message));
    }
  }
}
