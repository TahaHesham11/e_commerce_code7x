
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/custom_app_bar.dart';
import 'package:e_commerce_code7x/custom/custom_defaultField.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/custom/my_text.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/Complete_order/screen/done_screen/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen ({super.key});

  @override
  State<CompleteOrderScreen> createState() => CompleteOrderScreenState();
}

class CompleteOrderScreenState extends State<CompleteOrderScreen> {
  var nameAddressController = TextEditingController();

  var addressController = TextEditingController();
  var numberIdController = TextEditingController();
  var nameIdController = TextEditingController();
  var monthController = TextEditingController();
  var yearsController = TextEditingController();
  var otpController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool change = true;
  bool isWork=false;
  bool work=false;

  String selectedItem = ''; // Variable to hold the selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: MyText(
          text:'تفاصيل الطلب',
          fontSize: 20.sp,
          color: Colors.teal,
        ),
      ),


      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.all(15.0.r),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                MyText(text: 'عنوان الشحن',fontSize: 20.sp,fontWeight: FontWeight.bold,
                  padding: EdgeInsetsDirectional.only(start: 10.r),margin: EdgeInsetsDirectional.only(top: 20.r),),
                MyText(
                  margin: EdgeInsetsDirectional.only(start: 10.r,top: 10.r),
                  text: 'اسم العنوان',

                ),
                CustomDefaultField(

                  controller: nameAddressController,

                  type:TextInputType.text ,
                  validate: validate(text: 'name address'),

                ),
                MyText(
                  margin: EdgeInsetsDirectional.only(start: 10.r,top: 10.r),
                  text: 'العنوان كتابة',

                ),
                CustomDefaultField(

                  controller: addressController,

                  type:TextInputType.text ,
                  validate: validate(text: 'address'),

                ),

                MyText(text: 'برجاء اختيار موقعك علي الخريطة',
                  margin: EdgeInsetsDirectional.symmetric(vertical: 5.r),),



                MyButton(
                  margin: EdgeInsetsDirectional.only(top: 10.r),
                  width: 140.w,
                  text: 'حفظ العنوان',
                  onPressed: () {  },),
                CupertinoListTile(
                    padding: EdgeInsetsDirectional.only(top: 10.r),
                    title: MyText(text: "الاستلام عبر شخص اخر",fontSize: 17.sp,),
                    trailing: CupertinoSwitch(
                      value: change,
                      thumbColor: Colors.white,
                      activeColor: Colors.teal,

                      onChanged: (value) {

                        setState(() {
                          change=!change;
                        });
                      },
                    )
                ),

                MyText(text: 'اختيار شركة الشحن',fontSize: 20.sp,fontWeight: FontWeight.bold,),


                Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black)
                  ),
                  child: MaterialButton(
                    onPressed: (){},child: Row(children: [
                    const MyText(text: 'سمسا (1_3 ايام عمل)',color: Colors.grey,),
                    const Spacer(),

                    IconButton(
                        onPressed: (){
                          setState(() {
                            isWork=!isWork;
                          });
                        },
                        icon: Icon(isWork?Icons.circle:Icons.circle_outlined,color: Colors.teal,))
                  ],
                  ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black)
                  ),
                  child: MaterialButton(
                    onPressed: (){},child: Row(children: [
                    const MyText(text: 'ساعي (1_3 ايام عمل)',color: Colors.grey,),
                    const Spacer(),

                    IconButton(
                        onPressed: (){
                          setState(() {
                            work=!work;
                          });
                        },
                        icon: Icon(work?Icons.circle:Icons.circle_outlined,color: Colors.teal,))
                  ],
                  ),
                  ),
                ),





                CustomDefaultField(

                  controller: nameIdController,

                  type:TextInputType.name ,
                  validate: validate(text: 'name Id'),

                ),
                Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const MyText(text: 'الشهر'),
                          CustomDefaultField(

                            controller: monthController,

                            type:TextInputType.datetime ,
                            validate: validate(title: 'month'),

                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText(text: 'السنة'),

                          CustomDefaultField(

                            controller: yearsController,

                            type:TextInputType.datetime ,
                            validate: validate(title: 'years'),

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                MyText(
                  margin: EdgeInsetsDirectional.only(start: 10.r,top: 10.r),
                  text: 'رمز التحقق من البطاقة',

                ),
                CustomDefaultField(

                  controller: otpController,

                  type:TextInputType.phone ,
                  validate: validate(text: 'OTP'),

                ),
                Center(
                  child: MyButton(
                    width: 300.w,
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        navigateTo(context, const DoneScreen());
                      }
                    },
                    margin: EdgeInsetsDirectional.symmetric(vertical: 10.r),
                    background: Colors.white70,
                    text: 'اتمام الطلب',
                    border: Border.all(color: Colors.teal),
                    textColor: Colors.teal,),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
