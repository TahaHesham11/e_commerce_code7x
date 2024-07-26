import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/auth/login/view.dart';
import 'package:e_commerce_code7x/modules/auth/register/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0.r),
                child: Image.asset('assets/images/logo.png', width: 160.w, height: 160.h),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(text: 'Welcome to'.tr(), fontSize: 25.sp),
                  MyText(
                    text: 'X5smart',
                    color: const Color(0xffD43D74),
                    fontSize: 25.sp,
                    margin: EdgeInsetsDirectional.only(start: 5.r),
                  ),
                ],
              ),
              MyButton(
                margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),
                onPressed: () {
                  navigateTo(context, const LoginScreen());
                },
                text: 'Sign in'.tr(),
                background: const Color(0xffD43D74),
              ),
              MyButton(
                onPressed: () {
                  navigateTo(context, const RegisterScreen());
                },
                text: 'Create account'.tr(),
                textColor: const Color(0xffD43D74),
                background: Colors.white,
                border: Border.all(color: const Color(0xffD43D74)),
              ),
            ],
          ),
        ),
      )

    );
  }
}
