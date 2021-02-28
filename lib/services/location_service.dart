import 'package:geolocator/geolocator.dart';

class LocationService {
  Future getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      return position;
    } catch (e) {
      print("Error in getting location");
    }
  }
}
