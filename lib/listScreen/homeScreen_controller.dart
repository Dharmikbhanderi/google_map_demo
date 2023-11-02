import 'dart:convert';
import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  final airports = <Airport>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAirports();
  }

  Future<void> fetchAirports() async {
    checkConnectivity().then((value) async {
      if (value == true) {
        try {
          isLoading.value = true;
          final response = await http.get(Uri.parse(
              'https://raw.githubusercontent.com/mwgg/Airports/master/airports.json'));

          if (response.statusCode == 200) {
            isLoading.value = false;

            final Map<String, dynamic> data = json.decode(response.body);
            airports.value =
                data.values.map((item) => Airport.fromJson(item)).toList();
            final boxData = await Hive.openBox("ApiData");
            await boxData.addAll(airports);
          } else {
            isLoading.value = false;
            throw Exception('Failed to load data from the API');
          }
        } catch (e) {
          isLoading.value = false;
        }
      } else if (value == false) {
        loadData();
      }
    });
  }

  Future<List<Airport>> readDataFromHive() async {
    final box = await Hive.openBox('ApiData');
    final List<Airport> data =
        box.values.map((value) => value as Airport).toList();
    await box.close();
    return data;
  }

  Future<void> loadData() async {
    // First, try to load data from Hive
    final offlineData = await readDataFromHive();

    if (offlineData.isNotEmpty) {
      airports.assignAll(offlineData);
      print("Data is available");
      print("Data is available dataList ${airports.length}");
    } else {
      print("Data is not available offline");
    }
  }

  Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}

class Airport {
  final String icao;
  final String? iata;
  final String name;
  final String city;
  final String state;
  final String country;
  final int elevation;
  final double lat;
  final double lon;
  final String tz;

  Airport({
    required this.icao,
    required this.iata,
    required this.name,
    required this.city,
    required this.state,
    required this.country,
    required this.elevation,
    required this.lat,
    required this.lon,
    required this.tz,
  });

  Airport copyWith({
    String? icao,
    String? iata,
    String? name,
    String? city,
    String? state,
    String? country,
    int? elevation,
    double? lat,
    double? lon,
    String? tz,
  }) =>
      Airport(
        icao: icao ?? this.icao,
        iata: iata ?? this.iata,
        name: name ?? this.name,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        elevation: elevation ?? this.elevation,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        tz: tz ?? this.tz,
      );

  factory Airport.fromRawJson(String str) => Airport.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        icao: json["icao"],
        iata: json["iata"],
        name: json["name"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        elevation: json["elevation"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tz: json["tz"],
      );

  Map<String, dynamic> toJson() => {
        "icao": icao,
        "iata": iata,
        "name": name,
        "city": city,
        "state": state,
        "country": country,
        "elevation": elevation,
        "lat": lat,
        "lon": lon,
        "tz": tz,
      };
}
