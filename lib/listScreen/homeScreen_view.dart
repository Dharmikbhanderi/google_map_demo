import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicalMap/constants/app_colors.dart';
import 'package:practicalMap/constants/app_text.dart';
import 'package:practicalMap/listScreen/homeScreen_controller.dart';
import 'package:practicalMap/routes/app_pages.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController airportController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Practical Task'),
      ),
      body: Obx(
        () => airportController.airports.isEmpty ||
                airportController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: airportController.airports.length,
                itemBuilder: (context, index) {
                  final airport = airportController.airports[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.detailScreen, arguments: {
                        "name": airport.name,
                        "icao": airport.icao,
                        "city": airport.city,
                        "state": airport.state,
                        "country": airport.country,
                        "tz": airport.tz,
                        "lat": airport.lat,
                        "lon": airport.lon,
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorWhite,
                        border: Border.all(color: colorGreyLight4
                            ),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(airport.name,
                                      style: AppText.textBold.copyWith(
                                          fontSize: 20,
                                          overflow: TextOverflow.ellipsis))),
                              Text(airport.icao,
                                  style:AppText.textBold.copyWith(fontSize: 18)),
                            ],
                          ).marginOnly(bottom: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${airport.city}, ${airport.country}',
                                  style:
                                      AppText.textBold.copyWith(fontSize: 15)),
                              Text(airport.country,
                                  style:
                                      AppText.textBold.copyWith(fontSize: 15)),
                            ],
                          )
                        ],
                      ).marginAll(15),
                    ).marginOnly(bottom: 10),
                  );
                },
              ),
        // }
        // },
      ),
    );
  }
}
