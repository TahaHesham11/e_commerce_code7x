import 'package:e_commerce_code7x/core/validate.dart';
import 'package:e_commerce_code7x/end_points.dart';
import 'package:e_commerce_code7x/models/addressUserModel.dart';
import 'package:e_commerce_code7x/models/country_model.dart';
import 'package:e_commerce_code7x/models/post_address_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/states.dart';
import 'package:e_commerce_code7x/remote/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart' as latlong;
import '../../../../../../../../models/address_model.dart';

class CountryCubit extends Cubit<CountryStates> {
  CountryCubit() : super(CountryInitialStates());

  static CountryCubit get(context) => BlocProvider.of(context);

  MapController controller = MapController();

  latlong.LatLng? selectedPoint;

  latlong.LatLng? latLng;
  List<Marker> marker = [];

  void updateLatLng() {
    marker.clear();
    controller.move(latLng!, 13);

    marker.add(
      Marker(
        //   point:  widget.cubit!.selectedPoint! ,
        //point: widget.cubit!.latLng! ,

        point:  latLng!,
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 40.0.sp,
        ),
      ),
    );
    emit(CountryStateUpdated());
  }


  final nameAddressController = TextEditingController();

  final detailsAddressController = TextEditingController();

  bool isCheckBox = false;

  final formKey = GlobalKey<FormState>();

  CountryModel? countryModel;

  DataCountry? country;

  Regions? regions;
  Cities? cities;
  Districts? districts;

  Future<void> getCountry() async {
    emit(CountryLoadingStates());

    try {
      final response = await DioHelper.getData(url: countries);
      if (response.statusCode == 200) {
        countryModel = CountryModel.fromJson(response.data);
        emit(CountrySuccessStates());
      }
    } catch (e, p) {
      print(e.toString());
      print(p.toString());
      emit(CountryErrorStates());
    }
  }

  bool? isDefault=false;
  AddressUserModel? addressUserModel;

  Future<void> addAddress() async {
    emit(AddAddressLoadingState());

    try {
      final response =
          await DioHelper.postData(url: userAddresses, token: token, data: {
        'title': nameAddressController.text,
        'address': detailsAddressController.text,
        'is_default': isDefault,
        'city_id': cities!.id,
        'region_id': regions!.id,
        'longitude': selectedPoint?.longitude.toString(),
        'latitude': selectedPoint?.latitude.toString(),
      });

      if (response.statusCode == 200) {
        print('///////////////-------------/////////');

        addressUserModel = AddressUserModel.fromJson(response.data);
        print(addressUserModel!.data.toString());
        emit(AddAddressSuccessState());
        getAddress();
      }
    } catch (e, p) {
      print(e.toString());
      print(p.toString());
      emit(AddAddressErrorState());
    }
  }



  AddressModel? addressModel;

  Future<void> getAddress() async {
    emit(AddressLoadingState());
    try {
      final response =
          await DioHelper.getData(url: userAddresses, token: token);

      if (response.statusCode == 200) {
        addressModel = AddressModel.fromJson(response.data);
        emit(AddressSuccessState());
      }
    } catch (e, p) {
      print(e.toString());
      print(p.toString());
      emit(AddressErrorState());
    }
  }

  PostAddressModel? postAddressModel;
  Future<void> postOrder()async{

    emit(PostAddressLoadingState());
    try{
      final response = await DioHelper.postData(
          url: orders,
        token:token,

        data: {
            'payment_method_id': '1',
          'address_id': postAddressModel!.data.addressId,
        },

      );

      postAddressModel = PostAddressModel.fromJson(response.data);
      emit(PostAddressSuccessState());
    }catch(e,p){
      debugPrint(e.toString());
      debugPrint(p.toString());
      emit(PostAddressErrorState());
    }
  }

  void updateCountry(DataCountry value) {
    country = value;
    regions = null;
    cities = null;
    districts = null;
    emit(CountryUpdatedState());
  }

  void updateRegion(Regions value) {
    regions = value;
    cities = null;
    districts = null;
    emit(RegionUpdatedState());
  }

  void updateCity(Cities value) {
    cities = value;
    districts = null;
    emit(CityUpdatedState());
  }

  void updateDistrict(Districts value) {
    districts = value;
    emit(DistrictUpdatedState());
  }

//   PostAddressModel? postAddressModel;
//   void postAddress({
//    required int paymentId,
//    required int addressId,
//    required String latitude,
//    required String longitude,
// })async{
//
//     emit(PostAddressLoadingState());
//
//     try{
//       final response = await DioHelper.postData(
//         token: token,
//           url: orders,
//         data: {
//             'payment_method_id':paymentId,
//             'address_id':addressId,
//             'latitude':latitude,
//             'longitude':longitude,
//         }
//       );
//       if(response.statusCode ==200){
//         postAddressModel = PostAddressModel.fromJson(response.data);
//         print(postAddressModel!.data.address.toString());
//         emit(PostAddressSuccessState());
//
//       }
//     }catch(e,p){
//       print(e.toString());
//       print(p.toString());
//       emit(PostAddressErrorState());
//     }
//
//   }
}
