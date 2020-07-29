import 'package:flutter/material.dart';
import 'package:fmaps/src/map_options.dart';
import 'package:fmaps/src/map_provider.dart';

class FMaps extends StatelessWidget {
  final MapProvider provider;
  final MapOptions options;

  const FMaps(this.options, this.provider);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => FadeInImage(
        placeholder: null,
        image: provider.getStaticMap(options),
        fit: BoxFit.fill,
      ),
    );
  }
}
