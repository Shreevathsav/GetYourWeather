import 'package:geolocator/geolocator.dart';

class Locator {
  double latitude, longitude;

  Future<void> getCurrentloctaion() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
