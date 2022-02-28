import 'package:geolocator/geolocator.dart';

class LocationService {
  double? locationLatitude;
  double? locationLongitude;
  String? cityName;

  LocationService({
    this.locationLatitude,
    this.locationLongitude,
    this.cityName,
  });

  Future<void> checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission != LocationPermission.denied && serviceEnabled) {
      print("Three conditions are enabled");
      // return true;
    } else if (!serviceEnabled) {
      print("Location service is disabled");
      await Geolocator.openLocationSettings();
      // return true;
    } else {
      print("All conditions are down and out");
      // return false;
    }
  }

  Future<void> getCurrentLocationCoordinates() async {
    print("This method is being accessed");

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy
              .best); //TODO test location accuracy improvements on later versions
      locationLatitude = position.latitude;
      locationLongitude = position.longitude;
      print(locationLatitude);
    } on Exception catch (e) {
      print("getCurrentPosition() error : $e");
    } finally {
      print("This method was accessed");
    }
    // List<double> coordinates = [locationLatitude!, locationLongitude!];
  }

  // Future<List<double>> _getCityCoordinates() async {

  // } //TODO configure location in terms of city name
}
