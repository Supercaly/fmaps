import 'package:flutter/material.dart';
import 'package:fmaps/fmaps.dart';

class Map1Screen extends StatelessWidget {
  static const String placeholderUrl =
      "https://www.riccardogeraci.it/wp-content/uploads/2019/10/placeholder-1024x683.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Container(
              color: Colors.red,
              child: FMaps(
                options: MapOptions(
                  center: LatLng(43.840964, 12.412731),
                  zoom: 17.0,
                  markers: [
                    Marker(
                      position: LatLng(43.840964, 12.412731),
                      color: Colors.green,
                    ),
                  ],
                  placeholder: NetworkImage(placeholderUrl),
                ),
                provider: GeoapifyMapProvider(
                    apiKey: "ef924a4dd7464d58a1f295e9e7efafbd"),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
