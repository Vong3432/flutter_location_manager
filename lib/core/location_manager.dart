import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:location_manager/core/location_manager_delegate.dart';
import 'package:location_manager/location.dart';

class LocationManager {
  static const platform = MethodChannel('com.vong.dev/location_manager');

  // fields
  String status = "";
  final LocationAPI _locationAPI = LocationAPI();
  LocationCoordinate? locationCoordinate;

  // delgate
  LocationManagerDelegate? delegate;

  // constructor
  LocationManager({
    this.delegate,
  });

  Future<String> getLocationManagerStatus() async {
    try {
      await _locationAPI.requestLocationPermission();
      LocationStatus locationStatus = await _locationAPI.getLocationStatus();

      return locationStatus.status;
    } on PlatformException catch (e) {
      return status = "Failed to get location: '${e.message}'";
    }
  }

  Future<LocationCoordinate?> getCoordinate() async {
    try {
      getLocationManagerStatus();
      return await _locationAPI.getLocationCoord();
    } on PlatformException catch (e) {
      throw "Failed to get location: '${e.message}'";
    }
  }

  Future<void> watchLocation() async {
    getLocationManagerStatus();
    await _locationAPI.listenLocationCoordinate();
    platform.setMethodCallHandler(invokedMethods);
  }

  Future<void> stopWatchLocation() async {
    await _locationAPI.stopListenLocationCoordinate();
  }

  Future<dynamic> invokedMethods(MethodCall methodCall) async {
    try {
      switch (methodCall.method) {
        case "location_coordinate_changed":
          final Map<String, dynamic> map = jsonDecode(methodCall.arguments);
          locationCoordinate = LocationCoordinate(
            latitude: map["latitude"] ?? 0.0,
            longitude: map["longitude"] ?? 0.0,
          );
          print("Location changed: $map");

          // pass to delegate if have
          delegate?.onLocationCoordinateChanged(locationCoordinate);
          break;
      }
    } catch (e) {
      print("$e");
    }
  }
}
