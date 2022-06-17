import 'package:location_manager/location.dart';

abstract class LocationManagerDelegate {
  void onLocationCoordinateChanged(LocationCoordinate? coordinate);
}

// class LocationManagerDelegate with LocationManagerDelegateMixin {
//   @override
//   void onLocationCoordinateChanged(LocationCoordinate? coordinate) {}
// }
