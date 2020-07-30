import 'package:flutter/material.dart';

import '../fmaps.dart';

class GeoapifyMapProvider extends MapProvider {
  GeoapifyMapProvider({String apiKey}) : super(apiKey: apiKey);

  @override
  ImageProvider getStaticMap(int width, int height, MapOptions opt) {
    final baseUrl = "https://maps.geoapify.com/v1/staticmap?";
    final headers = {
      "style": "osm-carto",
      "width": width.toString(),
      "height": height.toString(),
    };
    if (opt.isCenter) {
      headers["center"] = "lonlat:${opt.center.longitude},${opt.center.latitude}";
      headers["zoom"] = opt.zoom.toString();
    } else
      headers["area"] = "rect:${opt.area[0].longitude},${opt.area[0].latitude},${opt.area[1].longitude},${opt.area[1].latitude}";
    headers["apiKey"] = apiKey;
    print(headers);
    String finalString = baseUrl;
    for(var e in headers.entries) {
      finalString += "${e.key}=${e.value}&";
    }
    print(finalString);
    return NetworkImage(finalString);
  }
}

//class ThunderforestMapProvider extends MapProvider {
//  @override
//  ImageProvider getStaticMap(MapOptions opt) {
//  }
//}
