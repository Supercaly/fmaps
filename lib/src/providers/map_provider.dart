import 'package:flutter/material.dart';
import '../map_options.dart';

/// Abstract class representing a map provider.
///
/// A map provider is a service that provides
/// tiles and static maps as images.
/// Normally map providers are restricted or payed
/// services and uses an api key to manage access to
/// their API; the parameter [apiKey] let you store
/// this [String].
///
/// When creating an FMaps a [MapProvider] must be specified,
/// you can use one of the built in providers or you can extend
/// this class to work with your provider of choice.
///
/// ```
/// class MyMapProvider extend MapProvider {
///   const MyMapProvider({String apiKey}): super(apiKey: apiKey);
///
///   @override
///   ImageProvider getStaticMap(int width, int height, MapOptions opt) {
///     final url = ""; // Generate the url for your provider
///     return NetworkImage(url);
///   }
/// }
/// ```
abstract class MapProvider {
  /// A String with the api key.
  final String apiKey;

  const MapProvider({this.apiKey});

  /// Returns an [ImageProvider] with the static map.
  /// For ease of customizability are provided the map's [width],
  /// [height] and [options].
  ImageProvider getStaticMap(int width, int height, MapOptions options);
}
