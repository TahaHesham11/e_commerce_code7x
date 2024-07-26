import 'dart:io';
import 'package:e_commerce_code7x/bloc_observer.dart';
import 'package:e_commerce_code7x/cache_helper.dart';
import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/modules/auth/welcome_screen/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/strings.dart/codegen_loader.g.dart';
import 'modules/layout_screen/settings/my_order/bloc/cubit.dart';
import 'modules/layout_screen/shoping/bloc/cubit.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print('on background message ');
  print((message.data.toString()));
  showToastStates(text: 'on background message', state: ToastStates.SUCCESS);
}


void main()async{

  // HttpClient createHttpClient(SecurityContext? context) {
  //   return createHttpClient(context)
  //     ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  // }
  // HttpOverrides.global = createHttpClient(context as SecurityContext?) as HttpOverrides?;

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCXOgmbyxMC4P0KEJ7ZjxNHvRHeH6nUoZE',
      appId: '1:883822851623:android:6ad5fc2b460a6dabcd4002',
      messagingSenderId: '883822851623',
      projectId: 'x5-smart-70a1f',
      storageBucket: 'x5-smart-70a1f.appspot.com',
    )
  );
  var firebaseToken = await FirebaseMessaging.instance.getToken();

  print(firebaseToken.toString());

  Bloc.observer=MyBlocObserver();



  Widget widget;


token = await CacheHelper.getData(key: 'token');

 print(token);

  FirebaseMessaging.onMessage.listen((event) {

    print('on message');
    print((event.data.toString()));

    showToastStates(text: 'on message', state: ToastStates.SUCCESS);

  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {

    print('on message opened app');
    print((event.data.toString()));
    showToastStates(text: 'on message opened app', state: ToastStates.SUCCESS);


  });


if(token !=null){
  widget = const LayoutScreen();

}else{
  widget = const WelcomeScreen();
}

print('999999999999999999999999-------------------------99999999999999');
  HttpOverrides.global = MyHttpOverrides();

  runApp(
      EasyLocalization(
    supportedLocales: const [Locale('ar','EG'),Locale('en','US'), ],
    path: 'assets/localization',
    fallbackLocale:CacheHelper.getBoolean(key: 'lang1') ? const Locale('en','US'):const Locale('ar','EG'),
    assetLoader: const CodegenLoader(),

    startLocale: CacheHelper.getBoolean(key: 'lang1') ? const Locale('en','US'):const Locale('ar','EG')  ,

    child: MyApp(
      startWidget: widget,
    ),
  )
  );
}


class MyApp extends StatelessWidget {
  final Widget? startWidget;

   MyApp({
    super.key,

    this.startWidget });

 static GlobalKey<NavigatorState> navigateKey = GlobalKey<NavigatorState>();

 static final BuildContext context = navigateKey.currentState!.context;

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context,child){
        return  MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => ShoppingCubit()..getCartProduct()

            ),
            BlocProvider(
              create: (BuildContext context) => OrderCubit()..getOrder(),

            ),
            BlocProvider(
              create: (BuildContext context)=>CountryCubit()..getCountry()..getAddress(),),
            BlocProvider(
              create: (BuildContext context) =>ShopCubit(),

            ),
            BlocProvider(
              create: (BuildContext context) => SettingCubit()..getPages()..getUserProfile(),

            ),
            BlocProvider(
              create: (BuildContext context) =>CategoriesCubit()..getCategories(),

            ),
            BlocProvider(
              create: (BuildContext context)=> HomeCubit()..getSlider()..getProduct()..getCategory()..filterBestProduct()..filterDiscount()..getProductsByCreationDate(),
            )
          ],
          child: MaterialApp(
            navigatorKey: navigateKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,


            theme: ThemeData(
                fontFamily: 'Tajawal',

                scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white
              )
            ),
            debugShowCheckedModeBanner: false,

                home: startWidget
            ),
        );
        }


    );
  }


}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
