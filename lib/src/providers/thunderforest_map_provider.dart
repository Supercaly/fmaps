import 'package:flutter/material.dart';
import '../map_options.dart';
import 'map_provider.dart';

/// Implementation of [MapProvider] for the Thunderforest service.
class ThunderforestMapProvider extends MapProvider {
  // Constant map's style Strings
  static const String cycle = "cycle";
  static const String transport = "transport";
  static const String landscape = "landscape";
  static const String outdoors = "outdoors";
  static const String transport_dark = "transport-dark";
  static const String spinal_map = "spinal-map";
  static const String pioneer = "pioneer";
  static const String mobile_atlas = "mobile-atlas";
  static const String neighbourhood = "neighbourhood";

  /// [String] representing the style of the map
  final String style;

  ThunderforestMapProvider({
    String apiKey,
    this.style = outdoors,
  }) : super(apiKey: apiKey);

  @override
  ImageProvider getStaticMap(int width, int height, MapOptions options) {
    final uri = Uri.https(
      "tile.thunderforest.com",
      "/static/$style/${options.center.longitude},${options.center.latitude},${options.zoom}/${width}x$height.png",
      {"apikey": apiKey},
    );
    return NetworkImage(uri.toString());
  }
}
