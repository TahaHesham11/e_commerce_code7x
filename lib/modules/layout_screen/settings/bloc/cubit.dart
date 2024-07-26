import 'dart:io';
import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/country_model.dart';
import 'package:e_commerce_code7x/models/get_profile.dart';
import 'package:e_commerce_code7x/models/login_model.dart';
import 'package:e_commerce_code7x/models/settings_model.dart';
import 'package:e_commerce_code7x/models/verifiy_login.dart';
import 'package:e_commerce_code7x/modules/auth/login/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../custom/my_text.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context) => BlocProvider.of(context);

  // LoginModel? loginModel;
  // void signOut(context)async{
  //   emit(SettingLoadingState());
  //
  //   try{
  //
  //     await DioHelper.postData(
  //         url: logout,
  //       token: token
  //
  //     );
  //     if(loginModel!.success!){
  //       navigateAndFinish(context,LoginScreen());
  //       emit(SettingSuccessState());
  //
  //     }
  //
  //   }catch(e){
  //     print(e.toString());
  //     emit(SettingErrorState());
  //   }
  // }

  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();


  ProfileModel? profileModel;

  void getUserProfile() async {
    emit(ProfileLoadingState());
    print('//////////////------------////////////////////');

    try {
      final response = await DioHelper.getData(
          url: getProfile,
          token: token
      );
      print('//////////////------------////////////////////');

      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data);
        emit(ProfileSuccessState());
      }
    } catch (e, p) {
      print(e.toString());
      print(p.toString());

      emit(ProfileErrorState());
    }
  }

  // City? city;

CountryModel? countryModel;
  Cities? cities;


  Districts? districts;
  // District? district;
  Future<void> updateUserProfile()async{
    emit(UpdateProfileLoadingState());
    try{
      final response = await DioHelper.postData(
          url: updateProfile,
          token:token,
          data: {
            'fname':nameController.text,
            'email':emailController.text,
            'phone':phoneController.text,
            'country_id':profileModel!.data!.country!.id,
            'lname':'taha',
            'city_id':profileModel!.data!.city!.id,
            'district_id': profileModel!.data!.district!.id,

          }
      );

      emit(UpdateProfileSuccessState());

      getUserProfile();
      if(response.statusCode == 200){
        print(response.data);
      }

    }catch(e,p){
      print(e.toString());
      print(p.toString());
      emit(UpdateProfileErrorState());
    }
  }

  File? profileImage;

  var picker = ImagePicker();


  Future<void> getProfileImage() async{


    emit(ProfileImagePickedLoadingState());
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery);
    if (pickedFile != null){
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    }else
    {
      print('No image selected');
      emit(ProfileImagePickedErrorState());
    }
  }

  SettingModel? settingModel;

  void getPages()async{
    emit(SettingsLoadingState());
    try{

      final response = await DioHelper.getData(url: pages,);

      if(response.statusCode == 200){
        settingModel = SettingModel.fromJson(response.data);
        print(response.data);
        emit(SettingsSuccessState());
      }

    }
    catch(e,p){
      print(e.toString());
      print(p.toString());
      emit(SettingsErrorState());
    }
  }


bool isAr = true;

  Future<void> onTap(context) async {
    if (EasyLocalization.of(context)!.locale.languageCode  !=  'ar') {

      await EasyLocalization.of(context)!.setLocale(const Locale('ar', 'EG'));

      await     CacheHelper.saveData(key: 'lang', value: 'ar');

      emit(LanguageIsArState());
      isAr = true;
    } else {

      await EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
      await     CacheHelper.saveData(key: 'lang', value: 'en');
      isAr = false;
      emit(LanguageIsArState());

    }

    emit(OnTapChange());

  }


  LoginModel? loginModel;

  Future<void> getLanguage(context) async {
    emit(LanguageLoadingState());

    try {
      final response = await DioHelper.postData(
        url: 'change-lang/${CacheHelper.getData(key: 'lang')}',
        token: token,
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        debugPrint('');
        loginModel=LoginModel.fromJson(response.data);
        // Assuming response data is in response.data
        // You can process your data here before emitting success state

        emit(LanguageSuccessState());
        print('${loginModel!.data!.locale}');

      } else {
        // Handle the case when the response status is not 200
        emit(LanguageErrorState());
      }
    } catch (e, p) {
      print(e.toString());
      print(p.toString());
      emit(LanguageErrorState());
    }
  }



  VerifyModel? deleteVerifyModel;
  final otpDeletePasswordController = TextEditingController();

  Future<void> deleteAccount(context)async{
    emit(DeleteAccountLoadingState());
    try{
      
      final response = await DioHelper.postData(
          url: deleteaccount,
        token: token,
        data: {
            'phone':phoneController.text
        }

      );

      if(response.statusCode == 200){
        deleteVerifyModel = VerifyModel.fromJson(response.data);

        print('//////////////////////////////---------------------////////////////');
        if(deleteVerifyModel!.success){
          showDialog(
              context: context,
              builder: (context) {
          return   AlertDialog(
            backgroundColor: Colors.white,
            title:  MyText(
              text:"otp".tr(),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: PinCodeTextField(
                textInputAction: TextInputAction.send,
                controller:otpDeletePasswordController,
                validator: validate(text: 'code'),
                appContext: context,
                length: 4,
                autoFocus: true,
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                obscureText: false,
                animationType: AnimationType.scale,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5.r),
                  borderWidth: 1.0.w,
                  activeFillColor: Colors.grey[200],
                  activeColor: Colors.grey[200],
                  inactiveColor: Colors.grey[200],
                  inactiveFillColor: Colors.white,
                  selectedColor: Colors.grey[200],
                  selectedFillColor: Colors.white,
                  inActiveBoxShadow:  [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.2),
                      offset: const Offset(0, -3),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                  activeBoxShadow:  [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.2),
                      offset: const Offset(0, -3),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (submitCode) {},
                onChanged: (value) {},
              ),
            ),
            actions: <Widget>[
              Center(
                child: MyButton(

                  onPressed: (){
                    deleteAccountVerify(context);
                  },
                  text: 'Next'.tr(),
                ),
              ),
            ],
          );
              },
          );
        }
        emit(DeleteAccountSuccessState(msg: deleteVerifyModel!.message));
      }

    }catch(e,p){
      print(e.toString());
      print(p.toString());
      emit(DeleteAccountErrorState(msg: deleteVerifyModel!.message));
    }
  }


 Future <void> deleteAccountVerify(context)async{
   emit(DeleteAccountVerifyLoadingState());
   try{
     final response = await DioHelper.postData(
         url: 'verify-delete-account',
         data: {
           'phone' : '01099015933',
           'otp': otpDeletePasswordController.text
         });
     if(response.statusCode == 200){
       emit(DeleteAccountVerifySuccessState(msg: deleteVerifyModel!.message,));
       // CacheHelper.removeData(key: 'token');
       // navigateAndFinish(context, const LoginScreen());
     }

   }
   catch(e,p){
     debugPrint(p.toString());
     debugPrint(e.toString());
     emit(DeleteAccountVerifyErrorState( msg: deleteVerifyModel!.message));
   }
 }


}