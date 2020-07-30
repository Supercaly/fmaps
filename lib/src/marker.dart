import 'package:flutter/material.dart';

import 'latlng.dart';

/// Represent a single Marker on the map
/// that has a specific [position] and
/// can be customized in [color]
class Marker {
  /// [LatLng] position of the marker.
  final LatLng position;

  /// [Color] of the marker.
  final Color color;

  Marker({
    this.position,
    this.color,
  });

  @override
  String toString() {
    return 'Marker{position: $position, color: $color}';
  }

  @override
  bool operator ==(Object other) =>
      other is Marker &&
      this.position == other.position &&
      this.color == other.color;

  @override
  int get hashCode => position.hashCode ^ color.hashCode;
}
