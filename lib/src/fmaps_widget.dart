import 'dart:convert';
import 'package:flutter/material.dart';
import 'placeholder.dart';
import 'fmaps_provider.dart';
import 'map_options.dart';
import 'providers/map_provider.dart';

/// Widget that shows to the screen a map
/// obtained by [provider].
/// The Map can be customized passing [options].
///
/// When created this widget has the same size of
/// his parent; if parent's width or height is Infinity,
/// NaN of Negative it will use the default values.
class FMaps extends StatefulWidget {
  static const int _defaultWidth = 600;
  static const int _defaultHeight = 400;

  final MapProvider provider;
  final MapOptions options;

  const FMaps({
    Key key,
    this.provider,
    @required this.options,
  })  : assert(options != null, "The given options must not be null!"),
        super(key: key);

  @override
  _FMapsState createState() => _FMapsState();
}

class _FMapsState extends State<FMaps> {
  ImageProvider _finalPlaceholder;

  @override
  void initState() {
    super.initState();
    // If the provided placeholder is null use the default
    if (widget.options.placeholder == null) {
      /*
       *  Create the placeholder as a MemoryImage obtained
       *  by converting a base64 string to Uint8List.
       */
      final placeholderUint8List =
          Base64Decoder().convert(placeholderBase64String);
      _finalPlaceholder = MemoryImage(placeholderUint8List);
    } else
      _finalPlaceholder = widget.options.placeholder;
  }

  @override
  void dispose() {
    _finalPlaceholder = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the MapProvider's instance
    final provider = this.widget.provider ?? FMapsProvider.of(context);
    assert(
      provider != null,
      '''
      Trying to build with a null instance of MapProvider.
      
        This can happen if:
        1. You didn't provide an instance of MapProvider in FMaps constructor
        2. You didn't use FMapsProvider to provide an instance fo FMaps
    ''',
    );

    print('build fmaps');
    return LayoutBuilder(
      builder: (context, constraints) {
        /*
         * Assign the map height and width depending on the parent's
         * constraints; if one of the constraints is Infinity, NaN
         * or Negative use the default value instead.
         */
        final mapWidth =
            (constraints.maxWidth.isFinite && !constraints.maxWidth.isNegative)
                ? constraints.maxWidth.floor()
                : FMaps._defaultWidth;
        final mapHeight = (constraints.maxHeight.isFinite &&
                !constraints.maxHeight.isNegative)
            ? constraints.maxHeight.floor()
            : FMaps._defaultHeight;
        return FadeInImage(
          placeholder: _finalPlaceholder,
          image: provider.getStaticMap(
            mapWidth,
            mapHeight,
            widget.options,
          ),
          fit: BoxFit.fill,
        );
      },
    );
  }
}
