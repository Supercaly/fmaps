import 'package:flutter/material.dart';
import '../map_options.dart';
import 'map_provider.dart';

class ThunderforestMapProvider extends MapProvider {
  ThunderforestMapProvider({String apiKey}) : super(apiKey: apiKey);

  @override
  ImageProvider getStaticMap(int width, int height, MapOptions options) {
    final uri = Uri.https(
      "tile.thunderforest.com",
      "/static/outdoors/${options.center.longitude},${options.center.latitude},${options.zoom}/${width}x$height.png",
      {"apikey": apiKey},
    );
    return NetworkImage(uri.toString());
  }
}
