/// Represent a point on the earth as a [latitude] and
/// [longitude].
class MapLocation {
  final double latitude;
  final double longitude;

  /// When creating a [MapLocation] [latitude] is clamped between [-90,90]
  /// and [longitude] is clamped between [-180,180].
  MapLocation(double latitude, double longitude)
      : this.latitude = latitude.clamp(-90.0, 90.0),
        this.longitude = longitude.clamp(-180.0, 180.0);

  @override
  String toString() {
    return 'MapLocation{latitude: $latitude, longitude: $longitude}';
  }

  @override
  bool operator ==(Object other) {
    return other is MapLocation &&
        this.latitude == other.latitude &&
        this.longitude == other.longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
