import 'package:flutter/material.dart';

import '../map_options.dart';
import 'map_provider.dart';

/// Implementation of [MapProvider] for the Geoapify service.
class GeoapifyMapProvider extends MapProvider {
  GeoapifyMapProvider({String apiKey}) : super(apiKey: apiKey);

  @override
  ImageProvider getStaticMap(int width, int height, MapOptions options) {
    // Define the query params based on the given options
    final params = {
      "style": "osm-carto",
      "width": width.toString(),
      "height": height.toString(),
      "apiKey": apiKey,
    };

    // Add the position as area or center/zoom
    if (options.isCenter) {
      params["center"] =
          "lonlat:${options.center.longitude},${options.center.latitude}";
      params["zoom"] = options.zoom.toString();
    } else
      params["area"] =
          "rect:${options.area[0].longitude},${options.area[0].latitude},${options.area[1].longitude},${options.area[1].latitude}";

    // Add the markers
    if (options.markers != null && options.markers.isNotEmpty) {
      List<String> markersStrings = [];
      for (var m in options.markers) {
        markersStrings
            .add("lonlat:${m.position.longitude},${m.position.latitude}");
      }
      print(markersStrings);
      params["marker"] = markersStrings.join("|");
    }

    final uri = Uri.https("maps.geoapify.com", "/v1/staticmap", params);
    print('GeoapifyMapProvider.getStaticMap: query url=$uri');
    return NetworkImage(uri.toString());
  }
}

//class ThunderforestMapProvider extends MapProvider {
//  @override
//  ImageProvider getStaticMap(MapOptions opt) {
//  }
//}
