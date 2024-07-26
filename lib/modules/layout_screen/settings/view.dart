import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_Drawer_list.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/auth/register/screen/contract/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/about_us/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/favorite/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/payment_method/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/privacy/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/profile/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/retrieval/view.dart';
import 'package:easy_localization/easy_localization.dart' as e;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../custom/Custom_Divider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBack: false,
        text: MyText(
          text: 'profileTitle'.tr(),
          color: Colors.teal,
          fontSize: 20.sp,
        ),
      ),


      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BlocConsumer<SettingCubit,SettingStates>(
              listener: (context, state) {},
              builder: (context, state) {
                final cubit = SettingCubit.get(context);

                var model = cubit.profileModel;

                if (model != null && model.data != null) {
                  cubit.nameController.text = model.data!.fname ?? '';
                  cubit.emailController.text = model.data!.email ?? '';

                }

                return cubit.profileModel != null && cubit.settingModel != null && cubit.nameController.text.isNotEmpty ?
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, const ProfileScreen());

                      },
                      child: Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(15.r),

                        ),
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 15.r),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r,vertical: 10.r),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Color(0xffCD4078),
                                    Color(0xff6169B1),
                                  ],
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 30.r,
                                backgroundColor: Colors.transparent,

                                child: CircleAvatar(
                                  radius: 28.r,
                                  backgroundImage: const AssetImage(
                                    'assets/images/account.png',

                                  ),

                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.only(top: 5.0.r),
                                  child: MyText(text: cubit.nameController.text),
                                ),
                                MyText(
                                  text: cubit.emailController.text,
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 20.0.r),
                      child: const CustomDivider(),
                    ),

                    Container(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r),
                      width: 350.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            offset: const Offset(0, 3), // الظل من الأسفل
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            offset: const Offset(0, -3), // الظل من الأعلى
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.3),
                            offset: const Offset(3, 0), // الظل من اليمين
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.3),
                            offset: const Offset(-3, 0), // الظل من اليسار
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          CustomDrawerList(
                            onTap: () {
                              navigateTo(context, const OrderScreen());
                            },
                            leadingIcon: IconButton(
                                onPressed: () {},
                                icon:  Image.asset(
                                    'assets/images/Orders icon.png'
                                )
                            ),
                            title: 'myOrders'.tr(),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: CacheHelper.getData(key: 'lang') == 'en' ?  Transform.rotate(
                                angle: pi,
                                child: Image.asset(
                                    'assets/images/angle-small-left.png'
                                ),
                              ): Image.asset(
                                  'assets/images/angle-small-left.png'
                              ),
                            ),
                          ),
                          CustomDrawerList(

                            leadingIcon:  IconButton(
                              onPressed: (){},
                              icon: const Icon( Icons.language,
                                color: Colors.black,),

                            ),
                            title: 'language',
                            trailing: CupertinoSwitch(
                                value: cubit.isAr ,
                                thumbColor: Colors.white,
                                activeColor: Colors.teal,
                                onChanged: (value) async {

                                  // if (easyLocalization.locale == const Locale('ar', "EG") && value == true) {
                                  //   await easyLocalization.setLocale(const Locale('en', 'US'));
                                  // } else {
                                  //   await easyLocalization.setLocale(const Locale('ar', 'EG'));
                                  // }
                                  // Ensure both functions complete before proceeding
                                  await cubit.getLanguage(context);
                                  await cubit.onTap(context);
                                  setState(() {
                                    cubit.isAr = value;
                                  });


                                }

                              // onChanged: (value) async {
                              //   if (context.locale == const Locale('ar', "EG") && value == true) {
                              //     await EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
                              //     await cubit.getLanguage(context);
                              //     await cubit.onTap(context);
                              //
                              //     setState(() {
                              //       cubit.language = value;
                              //     });
                              //   } else {
                              //     await EasyLocalization.of(context)!.setLocale(const Locale('ar', 'EG'));
                              //     await cubit.getLanguage(context);
                              //     await cubit.onTap(context);
                              //
                              //     setState(() {
                              //       cubit.language = value;
                              //     });
                              //   }
                              // },



                            ),
                          ),
                          CustomDrawerList(
                            onTap: () {
                              navigateTo(context,  PaymentMethodScreen());
                            },
                            leadingIcon: IconButton(
                              onPressed: () {},
                              icon:  Image.asset('assets/images/payment icon.png')
                            ),
                            title: 'payment methods'.tr(),
                            trailing: IconButton(
                              onPressed: () {},
                              icon:CacheHelper.getData(key: 'lang') == 'en' ?   Transform.rotate(
                                angle: pi,
                                child: Image.asset(
                                    'assets/images/angle-small-left.png'
                                ),
                              ):Image.asset(
                                  'assets/images/angle-small-left.png'
                              ),
                            ),
                          ),
                          CustomDrawerList(
                            onTap: () {
                              navigateTo(context, PrivacyScreen());
                            },
                            leadingIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.privacy_tip_outlined,
                                color: Colors.teal,
                              ),
                            ),
                            title: 'Privacy'.tr(),
                            trailing: IconButton(
                              onPressed: () {},
                              icon:CacheHelper.getData(key: 'lang') == 'en' ?   Transform.rotate(
                                angle: pi,
                                child: Image.asset(
                                    'assets/images/angle-small-left.png'
                                ),
                              ):Image.asset(
                                  'assets/images/angle-small-left.png'
                              ),
                            ),
                          ),
                          CustomDrawerList(
                            onTap: () {
                              navigateTo(context, const ContractScreen());
                            },
                            leadingIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.list_alt,
                                color: Colors.teal,
                              ),
                            ),
                            title: 'Terms'.tr(),
                            trailing: IconButton(
                              onPressed: () {},
                              icon:CacheHelper.getData(key: 'lang') == 'en' ?   Transform.rotate(
                                angle: pi,
                                child: Image.asset(
                                    'assets/images/angle-small-left.png'
                                ),
                              ): Image.asset(
                                  'assets/images/angle-small-left.png'
                              ),
                            ),
                          ),
                          CustomDrawerList(
                            onTap: () {
                              navigateTo(context, const RetrievalScreen());
                            },
                            leadingIcon: IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(
                                Icons.help_outline,
                                color: Colors.teal,
                              ),
                            ),
                            title: 'Exchange'.tr(),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: CacheHelper.getData(key: 'lang') == 'en' ?   Transform.rotate(
                                angle: pi,
                                child: Image.asset(
                                    'assets/images/angle-small-left.png'
                                ),
                              ):Image.asset(
                                  'assets/images/angle-small-left.png'
                              ),
                            ),
                          ),
                          CustomDrawerList(
                            onTap: () {
                              navigateTo(context, const FavoriteScreen());
                            },
                            leadingIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite,color: Colors.teal,)
                            ),
                            title: 'Favourite'.tr(),
                            trailing: IconButton(
                              onPressed: () {},
                              icon:  CacheHelper.getData(key: 'lang') == 'en' ?  Transform.rotate(
                                angle: pi,
                                child: Image.asset(
                                    'assets/images/angle-small-left.png'
                                ),
                              ):Image.asset(
                                  'assets/images/angle-small-left.png'
                              ),
                            ),
                          ),
                          CustomDrawerList(
                            onTap: () {
                              navigateTo(context, AboutUs());
                            },
                            leadingIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.app_blocking_outlined,
                                color: Colors.teal,
                              ),
                            ),
                            title: 'About US'.tr(),
                            trailing: IconButton(
                              onPressed: () {},
                              icon:  CacheHelper.getData(key: 'lang') == 'en' ?  Transform.rotate(
                                angle: pi,
                                child: Image.asset(
                                    'assets/images/angle-small-left.png'
                                ),
                              ): Image.asset(
                                  'assets/images/angle-small-left.png'
                              ),
                            ),
                          ),
                          // CustomDrawerList(
                          //   onTap: () {
                          //     signOut(context);
                          //   },
                          //   leadingIcon: IconButton(
                          //     onPressed: () {},
                          //     icon: const Icon(
                          //       Icons.login,
                          //       color: Colors.red,
                          //     ),
                          //   ),
                          //   title: 'Sign out'.tr(),
                          //   color: Colors.red,
                          // ),
                        ],
                      ),
                    ),

                    MyButton(
                      borderRadius: BorderRadius.circular(20.r),
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r,vertical: 20.r),
                      width: double.infinity,
                      background: Colors.red,
                      onPressed: (){
                        signOut(context);

                      },
                      text: 'Sign out'.tr(),
                    ),
                    MyButton(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 10.r),
                      borderRadius: BorderRadius.circular(20.r),
                      width: double.infinity,
                      background: Colors.white,
                      border: Border.all(color: Colors.black),
                      onPressed: (){
                        cubit.deleteAccount(context);
                      },
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                      text: 'Delete account'.tr(),
                      textColor: Colors.red,
                    ),
                    SizedBox(height: 30.h,),
                  ],
                ):const Center(child: CircularProgressIndicator(color: Colors.teal,));
              },
            ),
          ],
        ),
      ),
    );
  }
}
