import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practicalMap/constants/app_text.dart';
import 'package:practicalMap/detailScreen/detailScreen_controller.dart';

class DetailScreen extends GetView<DetailScreenController> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  GoogleMapController? controllerTest;

  CameraPosition? _kGooglePlex;

  DetailScreen() {
    _kGooglePlex = CameraPosition(
      target: LatLng(controller.detailLat.toDouble(), controller.detailLon.toDouble()),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex!,
            onMapCreated: (GoogleMapController controller) {
              controllerTest = controllerTest;
              // _controller.complete(controller);
            },
            markers: _createMarker(),
          ),
          Container(
            height: Get.width/3,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
              gradient: const LinearGradient(
                colors: [
                  Colors.white60,
                  Colors.lightBlueAccent
                ]),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey ,
                    blurRadius: 2.0,
                    offset: Offset(2.0,2.0)
                )
              ],),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name :- ${controller.detailName.toString()}",style: AppText.textSemiBold),
                Text("City :- ${controller.detailCity.toString()}",style: AppText.textSemiBold),
                Text("State :- ${controller.detailState.toString()}",style: AppText.textSemiBold),
                Text("Country :- ${controller.detailCountry.toString()}",style: AppText.textSemiBold),
                Text("Tz :- ${controller.detailTz.toString()}",style: AppText.textSemiBold),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(controller.detailLat.toDouble(), controller.detailLon.toDouble()),
        infoWindow: InfoWindow(title: controller.detailName.toString()),
          // rotation: 90
      ),
    };
  }
}

