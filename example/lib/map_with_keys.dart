import 'package:flutter/material.dart';
import 'package:fmaps/fmaps.dart';

class MapWithKeys extends StatefulWidget {
  @override
  _MapWithKeysState createState() => _MapWithKeysState();
}

class _MapWithKeysState extends State<MapWithKeys> {
  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400.0,
              child: FMaps(
                key: Key("map"),
                options: MapOptions(
                  center: MapLocation(43.840964, 12.412731),
                  zoom: 17.0,
                  markers: [
                    Marker(
                      position: MapLocation(43.840464, 12.412731),
                      color: Colors.green,
                    ),
                    Marker(
                      position: MapLocation(43.840964, 12.412931),
                      color: Color.fromARGB(255, 201, 178, 254),
                    ),
                  ],
                ),
                provider: GeoapifyMapProvider(
                    apiKey: "ef924a4dd7464d58a1f295e9e7efafbd"),
              ),
            ),
            Text("Counter: $_count")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => _count++),
      ),
    );
  }
}
