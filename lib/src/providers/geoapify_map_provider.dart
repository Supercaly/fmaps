import 'package:flutter/material.dart';

import '../map_options.dart';
import 'map_provider.dart';

/// Implementation of [MapProvider] for the Geoapify service.
class GeoapifyMapProvider extends MapProvider {
  GeoapifyMapProvider({String apiKey}) : super(apiKey: apiKey);

  @override
  ImageProvider getStaticMap(int width, int height, MapOptions opt) {
    // Define the query params based on the given options
    final params = {
      "style": "osm-carto",
      "width": width.toString(),
      "height": height.toString(),
      "apiKey": apiKey,
    };
    if (opt.isCenter) {
      params["center"] =
          "lonlat:${opt.center.longitude},${opt.center.latitude}";
      params["zoom"] = opt.zoom.toString();
    } else
      params["area"] =
          "rect:${opt.area[0].longitude},${opt.area[0].latitude},${opt.area[1].longitude},${opt.area[1].latitude}";

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
