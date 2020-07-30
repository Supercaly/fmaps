class LatLng {
  final double latitude;
  final double longitude;

  LatLng(double latitude, double longitude)
      : this.latitude = latitude.clamp(-90.0, 90.0),
        this.longitude = longitude.clamp(-180.0, 180.0);

  @override
  String toString() {
    return 'LatLng{latitude: $latitude, longitude: $longitude}';
  }

  @override
  bool operator ==(Object other) {
    return other is LatLng &&
        this.latitude == other.latitude &&
        this.longitude == other.longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
