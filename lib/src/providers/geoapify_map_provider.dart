import 'package:flutter/material.dart';
import '../map_location.dart';
import '../map_options.dart';
import '../marker.dart';
import 'map_provider.dart';

/// Implementation of [MapProvider] for the Geoapify service.
class GeoapifyMapProvider extends MapProvider {
  // Constant map's style Strings
  static const String osm_carto = "osm-carto";
  static const String osm_bright = "osm-bright";
  static const String osm_bright_grey = "osm-bright-grey";
  static const String osm_bright_smooth = "osm-bright-smooth";
  static const String klokantech_basic = "klokantech-basic";
  static const String positron = "positron";
  static const String positron_blue = "positron-blue";
  static const String positron_red = "positron-red";
  static const String dark_matter = "dark-matter";
  static const String dark_matter_brown = "dark_matter_brown";
  static const String dark_matter_dark_grey = "dark-matter-dark-grey";
  static const String dark_matter_dark_purple = "dark-matter-dark-purple";
  static const String dark_matter_purple_roads = "dark-matter-purple-roads";
  static const String dark_matter_yellow_roads = "dark-matter-yellow-roads";

  /// [String] representing the style of the map
  final String style;

  /// Creates a [GeoapifyMapProvider] with given
  /// [apiKey] and [style].
  /// style is one of the constant String values
  /// of [GeoapifyMapProvider].
  GeoapifyMapProvider({
    String apiKey,
    this.style = osm_carto,
  }) : super(apiKey: apiKey);

  @override
  ImageProvider getStaticMap(int width, int height, MapOptions options) {
    // Define the query params based on the given options
    final params = {
      "style": style,
      "width": width.toString(),
      "height": height.toString(),
      "apiKey": apiKey,
    };

    // Add the position as area or center/zoom
    if (options.isCenter) {
      params["center"] = _getCenterString(options.center);
      params["zoom"] = options.zoom.toString();
    } else
      params["area"] = _getAreaString(options.area);

    // Add the markers
    if (options.markers != null && options.markers.isNotEmpty)
      params["marker"] = _getMarkersString(options.markers);

    final uri = Uri.https("maps.geoapify.com", "/v1/staticmap", params);
    return NetworkImage(uri.toString());
  }

  /// Returns the string parameter for the center
  String _getCenterString(MapLocation c) => "lonlat:${c.longitude},${c.latitude}";

  /// Returns the string parameter for the area
  String _getAreaString(List<MapLocation> a) =>
      "rect:${a[0].longitude},${a[0].latitude},${a[1].longitude},${a[1].latitude}";

  /// Returns the string parameter for all the markers
  String _getMarkersString(List<Marker> m) => m.map((e) {
        String ret = "lonlat:${e.position.longitude},${e.position.latitude}";
        if (e.color != null)
          ret +=
              ";color:#${(e.color.value & 0XFFFFFF).toRadixString(16).padLeft(6, '0').toLowerCase()}";
        return ret;
      }).join("|");
}
