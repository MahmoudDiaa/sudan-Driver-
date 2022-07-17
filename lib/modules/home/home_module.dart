import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sudan_driver/layout/home/cubit/home_cubit.dart';
import 'package:sudan_driver/layout/home/cubit/home_state.dart';
import 'package:sudan_driver/shared/style/colors.dart';
import 'package:latlong2/latlong.dart';

class HomeModule extends StatelessWidget {
   const HomeModule({Key? key}) : super(key: key);
  //
  // static const CameraPosition _kGooglePlex =  CameraPosition(
  //   target: LatLng(15.508457, 32.522854),
  //   zoom: 5,
  // );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(builder: (context, state) {

      var cubit =HomeCubit.get(context);
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              // GoogleMap(
              //   zoomControlsEnabled: false,
              //   mapType: MapType.normal,
              //   initialCameraPosition: HomeModule._kGooglePlex,
              //   onMapCreated:cubit.onMapCreated ,
              // ),
              FlutterMap(options: MapOptions(
                  center: LatLng(15.508457, 32.522854),
                  zoom: 5,

              ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "Chat",
                  onPressed: null,backgroundColor: colorPrimary,child: Icon(LineIcons.rocketChat),),
              )
            ],
          )
          ,
           const Padding(
             padding: EdgeInsets.all(8.0),
             child: FloatingActionButton(
  heroTag: "speed",
               onPressed: null,backgroundColor: colorPrimary,child: Text('10'),),
           )

        ],
      );
    }, listener:  (context, state){}
    );
  }
}

