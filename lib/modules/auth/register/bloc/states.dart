import 'package:e_commerce_code7x/core/validate.dart';

class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{

  final String error;

  RegisterErrorState(this.error);
}


class VerifyLoadingState extends RegisterStates{}

class VerifySuccessState extends RegisterStates{
  final String msg;

  VerifySuccessState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }

}

class VerifyErrorState extends RegisterStates{

  final String msg;

  VerifyErrorState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }
}