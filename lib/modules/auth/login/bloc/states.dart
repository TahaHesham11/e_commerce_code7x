import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/models/verifiy_login.dart';

 class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

 class LoginSuccessState extends LoginStates{

 final String msg;

  LoginSuccessState({required this.msg}){
    showToastStates(
        text: msg!,
        state: ToastStates.SUCCESS
    );
}



}

class LoginErrorState extends LoginStates{

  final String msg;


  LoginErrorState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }

}



class VerifyLoadingState extends LoginStates{}

class VerifySuccessState extends LoginStates{
  final VerifyModel? verifyModel;

  final String msg;

  VerifySuccessState({required this.msg,this.verifyModel}){
    showToastStates(
        text: msg,
        state: ToastStates.SUCCESS
    );
  }



}

class VerifyErrorState extends LoginStates{

  final String msg;


  VerifyErrorState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }
}