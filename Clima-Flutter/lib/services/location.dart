import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  //METHOD THAT GETS THE CURRENT LOCATION
  //Future can be of type void
  Future<void> getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low); //asynchronous function

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);

      latitude = 0.0;
      longitude = 0.0;
    }
  }

  //GETTERS

  double getLatitude() {
    return latitude;
  }

  double getLongitude() {
    return longitude;
  }
}
