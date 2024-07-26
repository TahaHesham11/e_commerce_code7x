import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/modules/auth/login/view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


String? Function(String?)? validate({
  String? text,
  String? title,
}) {
  return (value) {
    if (value!.isEmpty) {
      if (text != null) {
        return 'please enter your $text';
      } else if (title != null) {
        return title;
      }
    }
    return null;
  };
}


void showToastStates({

  required String text,
  required ToastStates state,

})=>
    Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0);


enum ToastStates{SUCCESS , ERROR , WARNING}

Color chooseToastColor(ToastStates state){

  Color color;

  switch(state){
    case ToastStates.SUCCESS:
      color=Colors.green;
      break;
    case ToastStates.ERROR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
  return color;

}



void navigateTo (context,Widget) =>    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget)
);

void navigateAndFinish (context,Widget) =>    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => Widget),
        (route){
      return false;
    }
);

String? token = '';

void signOut(context){


  CacheHelper.removeData(key: 'token').then((value) {

    if(value){
      navigateAndFinish(context, const LoginScreen());
    }
  });

}


 Future<dynamic> restart(context) => Navigator.pushNamedAndRemoveUntil( context, '/' , (_) => false);

