class LatLon {
  final double latitude;
  final double longitude;

  LatLon(this.latitude, this.longitude);

  @override
  String toString() {
    return 'LatLon{latitude: $latitude, longitude: $longitude}';
  }
}