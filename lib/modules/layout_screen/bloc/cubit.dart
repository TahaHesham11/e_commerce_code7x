import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/modules/layout_screen/Categories/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/bloc/states.dart';
import 'package:e_commerce_code7x/modules/layout_screen/home/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/settings/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/shopping_cart/view.dart';
import 'package:e_commerce_code7x/modules/layout_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit(): super (ShopInitialState());

  static ShopCubit get(context)=>BlocProvider.of(context);

  int current =0;
  List<Widget> bottomScreen =
  [
    const HomeScreen(),
    const CategoryScreen(),
    const ShoppingCartScreen(),
    const SettingsScreen(),
  ];

  void changeBottom(index,context){

    current = index;
    if(index == 0){
      navigateTo(context, LayoutScreen(index: index,));
    }
    emit(ShopChangeNavBarState());

  }
}