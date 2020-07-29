import 'package:flutter/material.dart';

import 'latlng.dart';

class MapOptions {
  final LatLng center;
  final double zoom;
  final ImageProvider placeholder;

  MapOptions({
    this.center,
    this.zoom,
    this.placeholder,
  });
}
