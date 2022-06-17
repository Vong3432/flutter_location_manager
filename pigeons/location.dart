import 'package:pigeon/pigeon.dart';

class LocationStatus {
  final String status;

  LocationStatus(this.status);
}

class LocationCoordinate {
  final double latitude;
  final double longitude;

  LocationCoordinate(this.latitude, this.longitude);
}

@HostApi()
abstract class LocationAPI {
  LocationStatus getLocationStatus();
  LocationCoordinate? getLocationCoord();
  void requestLocationPermission();

  void listenLocationCoordinate();
  void stopListenLocationCoordinate();
  // void onLocationCoordinateChanged(LocationCoordinate? coord);
}
