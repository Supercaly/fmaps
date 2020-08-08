import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fmaps/src/map_location.dart';
import 'package:fmaps/src/marker.dart';

void main() {
  group("Marker Test", () {
    test("markers with same content are qeuals", () {
      final m1 = Marker(position: MapLocation(0.0, 0.0), color: Colors.red);
      final m2 = Marker(position: MapLocation(12.0, 43.0), color: Colors.blue);
      final m3 = Marker(position: MapLocation(0.0, 0.0), color: Colors.red);

      expect(m1, equals(m3));
      expect(m1, isNot(equals(m2)));

      expect(m2, isNot(equals(m1)));
      expect(m2, isNot(equals(m3)));

      expect(m3, equals(m1));
      expect(m3, isNot(equals(m2)));
    });
  });
}
