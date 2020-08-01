import 'package:flutter/material.dart';
import 'package:fmaps/fmaps.dart';

class DoubleMapWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FMapsProvider(
          provider:
              GeoapifyMapProvider(apiKey: "ef924a4dd7464d58a1f295e9e7efafbd"),
          child: ListView(children: [
            FMaps(
              options: MapOptions(
                center: LatLng(43.840964, 12.412731),
                zoom: 17.0,
                markers: [
                  Marker(
                    position: LatLng(43.840464, 12.412731),
                    color: Colors.green,
                  ),
                  Marker(
                    position: LatLng(43.840964, 12.412931),
                    color: Color.fromARGB(255, 201, 178, 254),
                  ),
                ],
              ),
            ),
            FMaps(
              options: MapOptions(
                center: LatLng(49.67939, 27.95930),
                zoom: 17.0,
                markers: [
                  Marker(
                    position: LatLng(49.67939, 27.95930),
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
