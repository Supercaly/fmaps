import 'package:flutter/material.dart';
import 'marker.dart';
import 'latlng.dart';

/// Represent a set of options used to
/// customize a specific map.
class MapOptions {
  /// A pair of [LatLng] object defining the rectangular
  /// bounding box of the map.
  final List<LatLng> area;

  /// A [LatLng] object defining the center of the map.
  ///
  /// This option must be used in conjunction with [zoom].
  final LatLng center;

  /// Value of the map's zoom; used only with [center].
  ///
  /// His value must be in range [1,20].
  final double zoom;

  /// List of [Marker]s for the map
  final List<Marker> markers;

  /// Defines an image used as placeholder while the map
  /// is downloaded form the web.
  final ImageProvider placeholder;

  MapOptions({
    this.area,
    this.center,
    this.zoom,
    this.markers,
    this.placeholder,
  })  : assert(
            (center == null && zoom == null && area != null) ||
                (center != null && zoom != null && zoom >= 1 && zoom <= 20.0),
            "When using center as map's position center and zoom must both be given. Zoom must be in range [1,20]"),
        assert(area == null || (area != null && area.length == 2),
            "When using area as map's position area must be a size 2 list of LatLng!");

  /// Returns true if the position is represented as center and zoom.
  bool get isCenter => center != null && zoom != null;

  /// Returns true if the position is represented as area.
  bool get isArea => area != null;
}
