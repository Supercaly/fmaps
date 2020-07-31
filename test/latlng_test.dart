import 'package:flutter_test/flutter_test.dart';
import 'package:fmaps/fmaps.dart';

void main() {
  group("LatLng Test", () {
    test("constructor clamps the values outside range", () {
      final l1 = LatLng(0.0, 0.0);
      final l2 = LatLng(-100.0, 200.0);
      final l3 = LatLng(100.0, -200.0);

      expect(l1.latitude, equals(0.0));
      expect(l1.longitude, equals(0.0));

      expect(l2.latitude, equals(-90.0));
      expect(l2.longitude, equals(180.0));

      expect(l3.latitude, equals(90.0));
      expect(l3.longitude, equals(-180.0));
    });

    test("equals works correctly", () {
      final l1 = LatLng(0.0, 0.0);
      final l2 = LatLng(3.5, 12.6);
      final l3 = LatLng(0.0, 0.0);

      expect(l1, isNot(equals(l2)));
      expect(l1, equals(l3));
    });
  });
}
