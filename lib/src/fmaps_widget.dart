import 'package:flutter/material.dart';
import 'package:fmaps/src/map_options.dart';
import 'package:fmaps/src/map_provider.dart';

/// Widget that shows to the screen a map
/// obtained by [provider].
/// The Map can be customized passing [options].
///
/// When created this widget has the same size of
/// his parent; if parent's width or height is Infinite,
/// NaN of Negative it will use the default values.
class FMaps extends StatelessWidget {
  static const int _defaultWidth = 600;
  static const int _defaultHeight = 400;

  final MapProvider provider;
  final MapOptions options;

  const FMaps(this.options, this.provider);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print('FMaps.build: Parent constraints=$constraints');
        final parentWidth =
            (constraints.maxWidth.isFinite && !constraints.maxWidth.isNegative)
                ? constraints.maxWidth.floor()
                : _defaultWidth;
        final parentHeight = (constraints.maxHeight.isFinite &&
                !constraints.maxHeight.isNegative)
            ? constraints.maxHeight.floor()
            : _defaultHeight;
        return FadeInImage(
          placeholder: options.placeholder,
          image: provider.getStaticMap(parentWidth, parentHeight, options),
          fit: BoxFit.fill,
        );
      },
    );
  }
}
