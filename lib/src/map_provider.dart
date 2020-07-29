import 'package:flutter/material.dart';
import 'map_options.dart';

abstract class MapProvider {
  const MapProvider();

  ImageProvider getStaticMap(MapOptions opt);
}

class GeoapifyMapProvider extends MapProvider {
  @override
  ImageProvider getStaticMap(MapOptions opt) {
    return NetworkImage("https://maps.geoapify.com/v1/staticmap", headers: {
      "style": "osm-carto",
      "width": "600",
      "height": "400",
      "center": "lonlat:${opt.center.longitude},${opt.center.latitude}",
      "zoom": opt.zoom.toString(),
      "apiKey": "ef924a4dd7464d58a1f295e9e7efafbd"
    });
  }

}

//class ThunderforestMapProvider extends MapProvider {
//  @override
//  ImageProvider getStaticMap(MapOptions opt) {
//  }
//}