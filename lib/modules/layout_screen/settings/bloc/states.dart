import '../../../../core/validate.dart';

class SettingStates{}

class SettingInitialState extends SettingStates{}

class SettingsLoadingState extends SettingStates{}
class SettingsSuccessState extends SettingStates{}
class SettingsErrorState extends SettingStates{}

class ProfileLoadingState extends SettingStates{}
class ProfileSuccessState extends SettingStates{}
class ProfileErrorState extends SettingStates{}

class UpdateProfileLoadingState extends SettingStates{}

class UpdateProfileSuccessState extends SettingStates{}

class UpdateProfileErrorState extends SettingStates{}

class ProfileImagePickedLoadingState extends SettingStates{}

class ProfileImagePickedSuccessState extends SettingStates{}
class ProfileImagePickedErrorState extends SettingStates{}


class LanguageLoadingState extends SettingStates{}
class LanguageSuccessState extends SettingStates{}
class LanguageErrorState extends SettingStates{}
class OnTapChange extends SettingStates{}


class LanguageIsArState extends SettingStates{}


class DeleteAccountLoadingState extends SettingStates{}
class DeleteAccountSuccessState extends SettingStates{
  late final String msg;

  DeleteAccountSuccessState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }
}
class DeleteAccountErrorState extends SettingStates{
  late final String msg;

  DeleteAccountErrorState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }
}

class DeleteAccountVerifyLoadingState extends SettingStates{}
class DeleteAccountVerifySuccessState extends SettingStates{
  late final String msg;

  DeleteAccountVerifySuccessState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }
}
class DeleteAccountVerifyErrorState extends SettingStates{
  late final String msg;

  DeleteAccountVerifyErrorState({required this.msg}){
    showToastStates(
        text: msg,
        state: ToastStates.ERROR);
  }
}



