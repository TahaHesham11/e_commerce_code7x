import 'package:e_commerce_code7x/custom/default_button.dart';
import 'package:e_commerce_code7x/custom/my_button.dart';
import 'package:e_commerce_code7x/models/post_address_model.dart';
import 'package:e_commerce_code7x/modules/layout_screen/shoping/screen/order_details/screen/compelete_address/bloc/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:flutter_map/flutter_map.dart';

class MapItem extends StatefulWidget {
  final Address? address;
  final CountryCubit?  cubit;
 final bool isButton;


  const MapItem({
    super.key,
    this.address,
    this.isButton = true,
    this.cubit ,
  });

  @override
  State<MapItem> createState() => _MapItemState();
}

class _MapItemState extends State<MapItem> {



  @override
  void initState() {
    super.initState();

      widget.cubit?.selectedPoint= const latlong.LatLng(31.037933, 31.381523);
   // widget.cubit?.updateLatLng(widget.cubit.selectedPoint);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: widget.isButton ?  MyButton(
        width: 124.w,
        onPressed: () {

          Navigator.pop(context);

        },
        text: 'Save'.tr(),
      ): DefaultButton(


        width: 160.w,
        text: 'تحديد موقعي',
      image: 'assets/images/map-pin.png',

      ),
      body: FlutterMap(
        mapController: widget.cubit!.controller,
        options: MapOptions(
          onTap: (TapPosition tapPosition, latlong.LatLng latLng) {
            widget.cubit?.selectedPoint = latLng  ;
          //  widget.cubit?.updateLatLng(latLng);
            print(widget.cubit?.selectedPoint.toString());
          },
          initialCenter:   widget.cubit?.selectedPoint!??widget.cubit!.latLng!,
          initialZoom: 13,

        ),
        children: [
          TileLayer(
            urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: widget.cubit!.marker,

          ),
        ],
      ),
    );
  }
}

