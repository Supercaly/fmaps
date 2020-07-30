import 'package:flutter/material.dart';
import 'map_options.dart';

abstract class MapProvider {
  final String apiKey;

  const MapProvider({this.apiKey});

  ImageProvider getStaticMap(int width, int height, MapOptions opt);
}
