import 'package:flutter/material.dart';
import 'package:fmaps/fmaps.dart';

class DoubleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            provider:
                GeoapifyMapProvider(apiKey: "ef924a4dd7464d58a1f295e9e7efafbd"),
          ),
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
            provider:
                GeoapifyMapProvider(apiKey: "ef924a4dd7464d58a1f295e9e7efafbd"),
          ),
        ]),
      ),
    );
  }
}
