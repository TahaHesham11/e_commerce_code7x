import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/verifiy_login.dart';
import 'package:e_commerce_code7x/modules/auth/login/components/show_dialog.dart';
import 'package:e_commerce_code7x/modules/auth/register/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/validate.dart';
import '../../../../custom/my_button.dart';
import '../../../../custom/my_text.dart';

class RegisterCubit extends Cubit<RegisterStates>{

  RegisterCubit() : super (RegisterStates());


  static RegisterCubit get(context)=>BlocProvider.of(context);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isCheckBox = false;

  var formKey = GlobalKey<FormState>();

  VerifyModel? verifyModel;
Future <void> user(context)async{
  emit(RegisterLoadingState());
  try{
  final response = await DioHelper.postData(
        url: register,
        data: {
          'fname' : firstNameController.text,
          'lname':'taha',
          'email':emailController.text,
          'phone' : phoneController.text,
          'country_id':'1'
        });


    if(response.statusCode ==200){

      verifyModel = VerifyModel.fromJson(response.data);

      if(verifyModel!.success){
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return CustomAlertDialog(
        //           loginOTPController: otpController,
        //           onConfirm: () {
        //             if (formKey.currentState!.validate()) {
        //               verifyRegister();
        //             }
        //           });
        //     });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title:  MyText(text:"otp".tr(),
                textAlign: TextAlign.center,),
              content: SingleChildScrollView(
                child: PinCodeTextField(

                  textInputAction: TextInputAction.send,
                  controller: otpController,
                  validator: validate(text: 'code'),
                  appContext: context,
                  length: 4,
                  autoFocus: true,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5.r),


                    borderWidth: 1.0.w,
                    activeFillColor: Colors.grey[200],
                    activeColor: Colors.grey[200],
                    inactiveColor: Colors.grey[200],
                    inactiveFillColor: Colors.white,
                    selectedColor: Colors.grey[200],
                    selectedFillColor: Colors.white,
                    inActiveBoxShadow:  [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.2),
                        offset: const Offset(0, -3),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],

                    activeBoxShadow:  [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.2),
                        offset: const Offset(0, -3),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],

                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (submitCode) {},
                  onChanged: (value) {},
                ),

              ),
              actions: <Widget>[
                Center(
                  child: MyButton(

                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        verifyRegister(context);

                      }
                    }, text: 'confirm'.tr(),
                  ),
                ),
              ],
            );
          },
        );

      }

      emit(RegisterSuccessState());

    }
  }
  catch(e,path){
    debugPrint(path.toString());
    debugPrint(e.toString());
    emit(RegisterErrorState(e.toString()));
  }
}


Future <void> verifyRegister(context)async{
  emit(VerifyLoadingState());
  try{
   await DioHelper.postData(
        url: verifyRegisterOTP,
        data: {
          'phone' : phoneController.text,
          'otp': otpController.text,
        });
    emit(VerifySuccessState(msg: verifyModel!.message,));
    navigateAndFinish(context, LayoutScreen());
  }
  catch(e,path){
    debugPrint(path.toString());
    emit(VerifyErrorState( msg: verifyModel!.message));
  }
}



}

