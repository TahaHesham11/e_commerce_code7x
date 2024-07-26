import 'package:e_commerce_code7x/modules/layout_screen/settings/favorite/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStates>{
  FavoriteCubit() : super(FavoriteInitialState());

  static FavoriteCubit get(context)=>BlocProvider.of(context);


}