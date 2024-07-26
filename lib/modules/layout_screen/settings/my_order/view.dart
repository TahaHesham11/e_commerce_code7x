import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/components/order_item.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/my_order/screen/details_order/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this); // قم بتغيير الطول إلى 4
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OrderCubit.get(context);

        return Scaffold(
          appBar: CustomAppBar(
            text: MyText(
              text: 'Orders'.tr(),
              fontSize: 20.sp,
              color: Colors.teal,
            ),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                TabBar(
                  physics:  const BouncingScrollPhysics(),
                  indicator: BoxDecoration(
                    
                    color:  const Color(0xffD43D74),

                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  dividerHeight: 0.0,

                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  controller: tabController,
                  unselectedLabelColor: Colors.black,


                  labelColor: Colors.white,
                  tabs:  [
                    Tab(
                      child: MyText(
                        text:  'All orders'.tr(),
                        padding: EdgeInsetsDirectional.all(8.r),

                      ),
                    ),
                    Tab(
                      child: MyText(

                          text: 'Delivered'.tr(),
                        padding: EdgeInsetsDirectional.all(8.r),

                      )
                    ),
                     Tab(
                      child: MyText(
                        text: 'canceled'.tr(),
                        padding: EdgeInsetsDirectional.all(8.r),

                      ),
                    ),
                     Tab(
                      child:MyText(
        text: 'Returns'.tr(),
                        padding: EdgeInsetsDirectional.all(8.r),

                      )
                    ),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children:  [
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {
                          if (cubit.ordersModel == null) {
                            return const Center(child: CircularProgressIndicator(color: Colors.teal));
                          }
                          if(cubit.ordersModel!.data!.data!.isEmpty || cubit.ordersModel!.data!.data == null){
                            return  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/order-now.png'),
                                MyText(text: 'You have no requests yet'.tr(),
                                  margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),),
                                MyButton(
                                    borderRadius: BorderRadius.circular(25.r),
                                    width: 180.w,
                                    background: const Color(0xffD43D74),
                                    onPressed: (){
                                      navigateTo(context, const LayoutScreen());
                                    },
                                    text: 'Discover categories'.tr())
                              ],
                            );
                          }

                          return cubit.ordersModel != null && cubit.ordersModel!.data!.data!.first.status == 'pending' ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  navigateTo(context, DetailsOrder(
                                    status: cubit.ordersModel!.data!.data![index].status!,
                                    orderId: cubit.ordersModel!.data!.data![index].orderId!,));
                                },
                                child: OrderItem(
                                  orderData: cubit.ordersModel!.data!.data![index],),
                              );

                            },
                            itemCount:  cubit.ordersModel!.data!.data!.length,
                          )
                              :const Center(child: CircularProgressIndicator(color: Colors.teal,));
                        },
                      ),


                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {
                          if (cubit.ordersModel == null) {
                            return const Center(child: CircularProgressIndicator(color: Colors.teal));
                          }
                          if(cubit.ordersModel!.data!.data!.isEmpty || cubit.ordersModel!.data!.data == null){
                            return  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/order-now.png'),
                                MyText(text: 'You have no requests yet'.tr(),
                                  margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),),
                                MyButton(
                                    borderRadius: BorderRadius.circular(25.r),
                                    width: 180.w,
                                    background: const Color(0xffD43D74),
                                    onPressed: (){
                                      navigateTo(context, const LayoutScreen());
                                    },
                                    text: 'Discover categories'.tr())
                              ],
                            );
                          }

                          return cubit.ordersModel != null && cubit.ordersModel!.data!.data!.first.status == 'Delivered' ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OrderItem(
                                orderData: cubit.ordersModel!.data!.data![index],);

                            },
                            itemCount:  cubit.ordersModel!.data!.data!.length,
                          )
                              : Center(child: MyText(text:'There are no orders delivered'.tr(),fontSize: 20.sp,fontWeight: FontWeight.bold,));
                        },
                      ),

                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {
                          if (cubit.ordersModel == null) {
                            return const Center(child: CircularProgressIndicator(color: Colors.teal));
                          }
                          if(cubit.ordersModel!.data!.data!.isEmpty || cubit.ordersModel!.data!.data == null){
                            return  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/order-now.png'),
                                MyText(text: 'You have no requests yet'.tr(),
                                  margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),),
                                MyButton(
                                    borderRadius: BorderRadius.circular(25.r),
                                    width: 180.w,
                                    background: const Color(0xffD43D74),
                                    onPressed: (){
                                      navigateTo(context, const LayoutScreen());
                                    },
                                    text: 'Discover categories'.tr())
                              ],
                            );
                          }

                          return cubit.ordersModel != null && cubit.ordersModel!.data!.data!.first.status == 'canceled' ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OrderItem(
                                orderData: cubit.ordersModel!.data!.data![index],);

                            },
                            itemCount:  cubit.ordersModel!.data!.data!.length,
                          )
                              : Center(child: MyText(text:'There are no canceled orders'.tr(),fontSize: 20.sp,fontWeight: FontWeight.bold,));
                        },
                      ),

                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {
                          if (cubit.ordersModel == null) {
                            return const Center(child: CircularProgressIndicator(color: Colors.teal));
                          }
                          if(cubit.ordersModel!.data!.data!.isEmpty || cubit.ordersModel!.data!.data == null){
                            return  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/order-now.png'),
                                MyText(text: 'You have no requests yet'.tr(),
                                  margin: EdgeInsetsDirectional.symmetric(vertical: 20.r),),
                                MyButton(
                                    borderRadius: BorderRadius.circular(25.r),
                                    width: 180.w,
                                    background: const Color(0xffD43D74),
                                    onPressed: (){
                                      navigateTo(context, const LayoutScreen());
                                    },
                                    text: 'Discover categories'.tr())
                              ],
                            );
                          }

                          return cubit.ordersModel != null && cubit.ordersModel!.data!.data!.first.status == 'Returns' ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return OrderItem(
                                orderData: cubit.ordersModel!.data!.data![index],);

                            },
                            itemCount:  cubit.ordersModel!.data!.data!.length,
                          )
                              : Center(child: MyText(text:'No orders have been returned'.tr(),fontSize: 20.sp,fontWeight: FontWeight.bold,));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
// BlocBuilder(
//   bloc: cubit,
//   builder: (context, state) {
//
//
//     return cubit.ordersModel != null ?
//   Expanded(
//     child: ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) {
//       return OrderItem(index:index,
//         orderData: cubit.ordersModel!.data!.data![index],);
//     },
//       separatorBuilder: (context, index) =>SizedBox(height: 15.h,) ,
//     itemCount: cubit.ordersModel!.data!.data!.length,
//     ),
//   )
//         :Center(child: CircularProgressIndicator(color: Colors.teal,));
//   },
// ),