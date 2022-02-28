import 'package:geolocator/geolocator.dart';

class LocationService {
  double? latitude;
  double? longitude;
  String? cityName;

  LocationService({
    this.latitude,
    this.longitude,
    this.cityName,
  });

  Future<List<double>> getCurrentLocationCoordinates() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy
            .medium); //TODO test location accuracy improvements on later versions
    latitude = position.latitude;
    longitude = position.longitude;
    List<double> coordinates = [latitude!, longitude!];
    return coordinates;
  }

  // Future<List<double>> _getCityCoordinates() async {


  // } //TODO configure location in terms of city name
}
