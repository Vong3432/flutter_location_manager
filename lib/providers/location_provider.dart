import 'package:flutter/material.dart';
import 'package:location_manager/core/location_manager.dart';
import 'package:location_manager/core/location_manager_delegate.dart';
import 'package:location_manager/location.dart';

class LocationAPIProvider with ChangeNotifier, LocationManagerDelegate {
  LocationCoordinate? coordinate;

  String status = "";

  late LocationManager locationManager = LocationManager(
    delegate: this,
  );

  Future<void> getStatus() async {
    String status = await locationManager.getLocationManagerStatus();
    this.status = status;
    notifyListeners();
  }

  Future<void> getCoordinate() async {
    await getStatus();
    LocationCoordinate? coordinate = await locationManager.getCoordinate();
    this.coordinate = coordinate;
    notifyListeners();
  }

  void watch() {
    getStatus();
    locationManager.watchLocation();
  }

  void stop() {
    locationManager.stopWatchLocation();
  }

  @override
  void onLocationCoordinateChanged(LocationCoordinate? coordinate) {
    this.coordinate = coordinate;
    notifyListeners();
  }
}
