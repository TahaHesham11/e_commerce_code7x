import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/custom_text_button.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/auth/login/view.dart';
import 'package:e_commerce_code7x/modules/auth/register/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/auth/register/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),

      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context, state) => RegisterCubit(),
        builder: (context, state) {

          var cubit = RegisterCubit.get(context);

          return Scaffold(
            appBar: CustomAppBar(
              isBack: false,
              text: MyText(
                text: 'Create account'.tr(),
                fontSize: 20.sp,
                color: Colors.teal,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 20.0.r),
                      child: Image.asset('assets/images/logo.png', width: 160.w, height: 160.h),
                    ),

                    SizedBox(
                      height: 800.h,
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
                            start: 20.0.r,
                            end: 10.r,
                            top: 15.r,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MyText(
                                          text: 'First Name'.tr(),
                                            margin: EdgeInsetsDirectional.only(start: 15.r)
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                            top: 5.0.r,
                                            bottom: 15.r,
                                          ),
                                          child: CustomDefaultField(
                                            controller: cubit.firstNameController,
                                            type: TextInputType.name,
                                            validate: validate(text: 'Name'.tr()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        MyText(
                                          text: 'Last Name'.tr(),
                                        margin: EdgeInsetsDirectional.only(start: 15.r),),

                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                            top: 5.0.r,
                                            bottom: 15.r,
                                          ),
                                          child: CustomDefaultField(
                                            controller: cubit.lastNameController,
                                            type: TextInputType.name,
                                            validate: validate(text: 'Name'.tr()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(start: 15.r),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    MyText(
                                      text: 'email'.tr(),
                                    ),
                                    MyText(text: '(optional)'.tr(),
                                      color: Colors.teal,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  top: 5.0.r,
                                  bottom: 15.r,
                                ),
                                child: CustomDefaultField(
                                  controller: cubit.emailController,
                                  type: TextInputType.emailAddress,
                                  validate: validate(text: 'email'.tr()),

                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(start: 15.r),
                                child:  MyText(
                                  text: 'phone'.tr(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  top: 5.0.r,
                                  bottom: 15.r,
                                ),
                                child: CustomDefaultField(
                                  controller: cubit.phoneController,
                                  type: TextInputType.phone,
                                  validate: validate(text: 'phone'.tr()),

                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(start: 15.r,top: 10.r),
                                child: MyText(text: 'Password'.tr()),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: 10.0.r, bottom: 10.r),
                                child: CustomDefaultField(
                                  controller: cubit.passwordController,
                                  type: TextInputType.visiblePassword,
                                ),
                              ),

                              Container(
                                margin: EdgeInsetsDirectional.only(start: 15.r,top: 10.r),
                                child: MyText(text: 'Confirm password'.tr()),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: 10.0.r, bottom: 10.r),
                                child: CustomDefaultField(
                                  controller: cubit.confirmPasswordController,
                                  type: TextInputType.visiblePassword,
                                ),
                              ),

                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 20.0.r),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //
                              //       GestureDetector(
                              //         onTap: (){
                              //           navigateTo(context, const ContractScreen());
                              //         },
                              //
                              //         child: RichText(
                              //           text: TextSpan(
                              //               style: TextStyle(
                              //                   fontSize: 16.sp,
                              //                   color: Colors.black
                              //               ),
                              //               children:  <TextSpan>[
                              //                 TextSpan(
                              //                   text: 'I agree'.tr(),
                              //                   style: const TextStyle(fontWeight: FontWeight.bold),
                              //                 ),
                              //                 TextSpan(
                              //                   text: 'Terms'.tr(),
                              //                   style: const TextStyle(
                              //                     fontWeight: FontWeight.bold,
                              //                     color: Colors.teal,
                              //
                              //                     decoration: TextDecoration.underline,
                              //                   ),
                              //
                              //
                              //                 ),
                              //
                              //
                              //               ]
                              //           ),
                              //
                              //         ),
                              //       ),
                              //       Checkbox(
                              //         activeColor: cubit.isCheckBox ? Colors.teal : Colors.transparent,
                              //         value: cubit.isCheckBox,
                              //         onChanged: (value) {
                              //           setState(() {
                              //             cubit.isCheckBox = !cubit.isCheckBox;
                              //           });
                              //         },
                              //         splashRadius: 20,
                              //         visualDensity: VisualDensity.compact,
                              //       ),
                              //     ],
                              //   ),
                              // ),

                              BlocBuilder<RegisterCubit,RegisterStates>(

                                builder: (context, state) {

                                  if(state is RegisterLoadingState){
                                    return const Center(child: CircularProgressIndicator());
                                  }else{
                                   return MyButton(
                                      onPressed: () {
                                        if (cubit.formKey.currentState!.validate()) {
                                          cubit.user(context);

                                        }
                                      },

                                      text: 'Create account'.tr(),
                                      textColor: Colors.white,
                                      width: 400.w,
                                      background: Colors.teal,
                                    );
                                  }
                                },
                              ),

                              Padding(
                                padding:  EdgeInsetsDirectional.only(top: 30.0.r),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     MyText(text: 'Dont already have an account?'.tr()),

                                    CustomTextButton(
                                      fontSize: 14.sp,
                                      onPressed: () {
                                        navigateTo(context, const LoginScreen());
                                      },
                                      text: 'Sign in'.tr(),

                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
