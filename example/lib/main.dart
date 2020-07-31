import 'package:example/double_map.dart';
import 'package:example/double_map_with_provider.dart';
import 'package:example/single_map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FMaps Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (_) => HomePage(),
        "/single_map": (_) => SingleMap(),
        "/double_map": (_) => DoubleMap(),
        "/double_map_prov": (_) => DoubleMapWithProvider(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter FMaps Demo Home Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, "/single_map"),
              child: Padding(
                child: Text("Single Map"),
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, "/double_map"),
              child: Padding(
                child: Text("Double Map"),
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, "/double_map_prov"),
              child: Padding(
                child: Text("Double Map with common Provider"),
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
