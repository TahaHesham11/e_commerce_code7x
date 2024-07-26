import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/auth/login/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/auth/login/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomAlertDialog extends StatelessWidget {
  final TextEditingController loginOTPController;
  final void Function()? onConfirm;

  const CustomAlertDialog({
    required this.loginOTPController,
    required this.onConfirm,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title:  MyText(
              text:"otp".tr(),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: PinCodeTextField(
                textInputAction: TextInputAction.send,
                controller:loginOTPController,
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

                  onPressed: onConfirm,
                  text: 'Next'.tr(),
                ),
              ),
            ],
          );
        },


      ),
    );
  }
}
