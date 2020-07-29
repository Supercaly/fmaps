import 'package:flutter/material.dart';
import 'package:fmaps/fmaps.dart';

class Map1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            FMaps(
                MapOptions(
                  LatLon(43.840964, 12.412731),
                  17.0,
                  NetworkImage(
                      "https://www.riccardogeraci.it/wp-content/uploads/2019/10/placeholder-1024x683.png"),
                ),
                GeoapifyMapProvider()),
          ]),
        ),
      ),
    );
  }
}
