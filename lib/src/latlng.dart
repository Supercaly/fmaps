/// Represent a point on the earth as a [latitude] and
/// [longitude].
class LatLng {
  final double latitude;
  final double longitude;

  /// When creating a [LatLng] [latitude] is clamped between [-90,90]
  /// and [longitude] is clamped between [-180,180].
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
