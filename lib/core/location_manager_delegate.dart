import 'package:location_manager/location.dart';

mixin LocationManagerDelegateMixin {
  void onLocationCoordinateChanged(LocationCoordinate? coordinate);
}

// abstract class LocationManagerDelegate with LocationManagerDelegateMixin {
//   @override
//   void onLocationCoordinateChanged(LocationCoordinate? coordinate) {}
// }
