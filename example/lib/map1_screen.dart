import 'package:flutter/material.dart';
import 'package:fmaps/fmaps.dart';

class Map1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FMaps(
            MapOptions(),
            GeoapifyMapProvider()
          ),
        ),
      ),
    );
  }
}
