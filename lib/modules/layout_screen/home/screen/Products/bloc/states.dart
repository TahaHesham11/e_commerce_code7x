
import 'package:e_commerce_code7x/models/product_model.dart';

class SearchStates{}

class SearchInitialState extends SearchStates{}

class GetAllProductLoadingState extends SearchStates{}
class GetAllProductSuccessState extends SearchStates{}
class GetAllProductErrorState extends SearchStates{}

class GetSearchLoadingState extends SearchStates{}
class GetSearchSuccessState extends SearchStates{
  GetSearchSuccessState(List<DataProduct>? dataProductsLis);
}
class GetSearchErrorState extends SearchStates{}

