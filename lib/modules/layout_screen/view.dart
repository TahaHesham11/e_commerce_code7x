import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/bloc/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LayoutScreen extends StatefulWidget {
  final int? index;
   const LayoutScreen({super.key, this.index});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  bool language = false;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {

        final cubit = ShopCubit.get(context);

        return Scaffold(

          floatingActionButtonLocation: CacheHelper.getData(key:'lang') == 'en' ?  FloatingActionButtonLocation.startFloat : FloatingActionButtonLocation.endFloat ,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              launchUrl('https://web.whatsapp.com/');
            },
            child:  Image.asset(
              'assets/images/whatsapp_3670051.png',
              width: 45.w,
              height: 45.h,
            ),
          ),

          body: cubit.bottomScreen[cubit.current],
          bottomNavigationBar:  Stack(
            alignment: Alignment.bottomCenter,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                child: BottomNavigationBar(
                  elevation: 0.0,

                  currentIndex: cubit.current,

                  backgroundColor: Colors.teal,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index){
                      cubit.changeBottom(index,context);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(

                            backgroundColor: cubit.current == 0 ?Colors.teal : Colors.transparent,
                            radius: 14.r,

                            child: Image.asset(
                              'assets/images/home.png',
                              color: cubit.current == 0 ? Colors.white :Colors.white,
                            ),
                          ),
                          SizedBox(width: 5.w), // Add spacing between icon and label
                          cubit.current == 0 ? MyText(text:'Home'.tr(),fontSize: 13.sp,
                            color: cubit.current == 0 ?Colors.white : Colors.transparent,) : Container(),
                        ],
                      ),
                      label: '', // Add the label for the BottomNavigationBarItem
                    ),
                    BottomNavigationBarItem(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:cubit.current == 1 ?Colors.teal : Colors.transparent,
                            radius: 12.r,
                            child: Image.asset(
                              'assets/images/category.png',
                              color: cubit.current == 1 ? Colors.white : Colors.white,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          cubit.current == 1 ? MyText(text: 'Category'.tr(),fontSize: 12.sp,
                            color: cubit.current == 1 ?Colors.white : Colors.transparent,) : Container(),
                        ],
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:cubit.current == 2 ?Colors.teal : Colors.transparent,
                            radius: 14.r,
                            child: Image.asset(
                              'assets/images/shopping.png',
                              color: cubit.current == 2 ? Colors.white : Colors.white,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          cubit.current == 2 ? MyText(text:'Shop'.tr(),fontSize: 13.sp,
                            color: cubit.current == 2 ?Colors.white : Colors.transparent,) : Container(),
                        ],
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: cubit.current == 3 ?Colors.teal : Colors.transparent,
                            radius: 11.r,
                            child: Image.asset(
                              'assets/images/profile.png',
                              color: cubit.current == 3 ? Colors.white: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          cubit.current == 3 ? MyText(
                            text: 'settings'.tr(),
                            fontSize: 13.sp,
                            color: cubit.current == 3 ?Colors.white : Colors.transparent,) : Container(),
                        ],
                      ),
                      label: '',
                    ),

                  ],
                ),
              ),
              // AnimatedPositioned(
              //   duration: const Duration(milliseconds: 200),
              //   bottom: 15.r,
              //   right: MediaQuery.of(context).size.width / cubit.bottomScreen.length * cubit.current,
              //   child: Container(
              //     margin: EdgeInsetsDirectional.only(start:22.r),
              //     width: MediaQuery.of(context).size.width  / cubit.bottomScreen.length  / 2,
              //     height: 2.h,
              //
              //
              //     color: Colors.white,
              //   ),
              // ),
            ],
          )

        );
      },
    );
  }

  Future<void> launchUrl(String url) async {
    await canLaunch(url) ? await launchUrl (url) : throw 'Could not launch $url';
  }


}
