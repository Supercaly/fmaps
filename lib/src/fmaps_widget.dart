import 'package:flutter/material.dart';
import 'map_options.dart';
import 'providers/map_provider.dart';

/// Widget that shows to the screen a map
/// obtained by [provider].
/// The Map can be customized passing [options].
///
/// When created this widget has the same size of
/// his parent; if parent's width or height is Infinity,
/// NaN of Negative it will use the default values.
class FMaps extends StatelessWidget {
  static const int _defaultWidth = 600;
  static const int _defaultHeight = 400;

  final MapProvider provider;
  final MapOptions options;

  const FMaps({
    this.provider,
    @required this.options,
  }) : assert(options != null, "The given options must not be null!");

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print('FMaps.build: Parent constraints=$constraints');
        /*
         * Assign the map height and width depending on the parent's
         * constraints; if one of the constraints is Infinity, NaN
         * or Negative use the default value instead.
         */
        final mapWidth =
            (constraints.maxWidth.isFinite && !constraints.maxWidth.isNegative)
                ? constraints.maxWidth.floor()
                : _defaultWidth;
        final mapHeight = (constraints.maxHeight.isFinite &&
                !constraints.maxHeight.isNegative)
            ? constraints.maxHeight.floor()
            : _defaultHeight;
        return FadeInImage(
          placeholder: options.placeholder,
          image: provider.getStaticMap(
            mapWidth,
            mapHeight,
            options,
          ),
          fit: BoxFit.fill,
        );
      },
    );
  }
}
