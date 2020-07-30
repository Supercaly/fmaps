import 'package:flutter/material.dart';
import '../latlng.dart';
import '../map_options.dart';
import '../marker.dart';
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
      params["center"] = _getCenterString(options.center);
      params["zoom"] = options.zoom.toString();
    } else
      params["area"] = _getAreaString(options.area);

    // Add the markers
    if (options.markers != null && options.markers.isNotEmpty)
      params["marker"] = _getMarkersString(options.markers);

    final uri = Uri.https("maps.geoapify.com", "/v1/staticmap", params);
    print('GeoapifyMapProvider.getStaticMap: query url=$uri');
    return NetworkImage(uri.toString());
  }

  /// Returns the string parameter for the center
  String _getCenterString(LatLng c) => "lonlat:${c.longitude},${c.latitude}";

  /// Returns the string parameter for the area
  String _getAreaString(List<LatLng> a) =>
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