import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/auth/login/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/auth/login/bloc/states.dart';
import 'package:e_commerce_code7x/modules/auth/register/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_code7x/custom/custom_text_button.dart';
import '../../../core/validate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<LoginCubit, LoginStates>(
            builder: (BuildContext context, state) {
              final cubit = LoginCubit.get(context);
              return Scaffold(
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0.r),
                          child: Image.asset('assets/images/logo.png',
                              width: 160.w, height: 160.h),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 500.h,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.0.r),
                                    topRight: Radius.circular(40.0.r),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, -3),
                                      blurRadius: 8,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 20.0.r, end: 10.r, top: 15.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: MyText(text: 'Sign in'.tr())),
                                      Center(
                                          child: MyText(
                                              text: 'Welcome back'.tr(),
                                              margin:
                                                  EdgeInsetsDirectional.only(
                                                      top: 10.r,
                                                      bottom: 15.r))),
                                      Container(
                                        margin: EdgeInsetsDirectional.only(
                                            start: 15.r),
                                        child: MyText(text: 'Phone'.tr()),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            top: 5.0.r, bottom: 5.r),
                                        child: CustomDefaultField(
                                          controller: cubit.phoneController,
                                          type: TextInputType.emailAddress,
                                          validate: validate(text: 'phone'),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.only(
                                            start: 15.r, top: 10.r),
                                        child: MyText(text: 'Password'.tr()),
                                      ),
                                      CustomDefaultField(
                                        controller: cubit.passwordController,
                                        type: TextInputType.visiblePassword,
                                      ),
                                      Align(
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          child: MyText(
                                            text: 'Forget password'.tr(),
                                            margin: EdgeInsetsDirectional.only(
                                                end: 15.r, bottom: 30.r),
                                          )),
                                      BlocBuilder<LoginCubit, LoginStates>(
                                        bloc: cubit,
                                        builder: (context, state) {
                                          // return MyButton(
                                          //   onPressed:  () {
                                          //     if (cubit.formKey.currentState!.validate()) {
                                          //       cubit.userLogin(context);
                                          //     }
                                          //   },
                                          //   text:   'Sign in'.tr(),
                                          //   textColor: Colors.white,
                                          //   width: double.infinity.w,
                                          //   background: Colors.teal,
                                          //
                                          // );
                                          return Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Container(

                                              height: 45.h ,
                                              width: 200.h ,


                                              decoration: BoxDecoration(

                                                  borderRadius:BorderRadius.circular(10.r),
                                                  color: Colors.teal,
                                                  border: Border.all(color: Colors.transparent),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      spreadRadius: 4,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 3),
                                                    )
                                                  ]
                                              ),
                                              child: MaterialButton(
                                                onPressed: () {
                                                  if (cubit.formKey.currentState!.validate()) {
                                                    cubit.userLogin(context);
                                                  }
                                                },
                                                child: state is LoginLoadingState
                                                    ? const Center(child: CircularProgressIndicator(color: Colors.white,))
                                                    : Center(child: MyText(text: 'Sign in'.tr(),color: Colors.white,)),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                              text: 'dont have account'.tr()),
                                          CustomTextButton(
                                            onPressed: () {
                                              navigateTo(context,
                                                  const RegisterScreen());
                                            },
                                            text: 'Create account'.tr(),
                                            fontSize: 15.sp,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
