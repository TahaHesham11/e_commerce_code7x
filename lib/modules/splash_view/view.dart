import 'package:e_commerce_code7x/modules/auth/login/view.dart';
import 'package:e_commerce_code7x/modules/auth/welcome_screen/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/validate.dart';

class SplashViewScreen extends StatefulWidget {
  const SplashViewScreen({super.key});

  @override
  State<SplashViewScreen> createState() => _SplashViewScreenState();
}

class _SplashViewScreenState extends State<SplashViewScreen> {
  @override
  void initState() {
    super.initState();
   startDelayedAction();
  }
  @override
  Widget build(BuildContext context) {
    return      Scaffold(


        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: Image.asset('assets/images/logo.png')),
            ],
          ),
        )
    );

  }


  void startDelayedAction() {
    Future.delayed(const Duration(seconds: 5), () {
      if(token !=null){
        navigateAndFinish(context, const LayoutScreen());

      }else{
        navigateAndFinish(context, const WelcomeScreen(),);
      }
    });
  }
}
