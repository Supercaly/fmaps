import 'package:flutter_test/flutter_test.dart';
import 'package:fmaps/fmaps.dart';

void main() {
  group("MapOptions Test", () {
    test("init with center and zoom", () {
      final opt = MapOptions(
        center: MapLocation(0.0, 0.0),
        zoom: 11.0,
      );

      expect(opt.center, isNotNull);
      expect(opt.center, equals(MapLocation(0.0, 0.0)));

      expect(opt.zoom, isNotNull);
      expect(opt.zoom, equals(11.0));

      expect(opt.area, isNull);

      expect(opt.placeholder, isNull);
    });

    test("init with area", () {
      final opt = MapOptions(area: [
        MapLocation(0.0, 0.0),
        MapLocation(0.0, 0.0),
      ]);

      expect(opt.area, isNotNull);
      expect(opt.area, hasLength(2));

      expect(opt.center, isNull);
      expect(opt.zoom, isNull);

      expect(opt.placeholder, isNull);
    });

    test("init with null center or zoom throws exception", () {
      try {
        MapOptions();
        fail("This should throw an assertion error!");
      } catch (e) {
        expect(e, isA<AssertionError>());
      }

      try {
        MapOptions(
          zoom: 10.0,
        );
        fail("This should throw an assertion error!");
      } catch (e) {
        expect(e, isA<AssertionError>());
      }

      try {
        MapOptions(center: MapLocation(0.0, 0.0));
        fail("This should throw an assertion error!");
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });

    test("init with null area throws exception", () {
      try {
        MapOptions();
        fail("This should throw an assertion error!");
      } catch (e) {
        expect(e, isA<AssertionError>());
      }

      try {
        MapOptions(area: [
          MapLocation(0.0, 0.0),
          MapLocation(0.0, 0.0),
          MapLocation(0.0, 0.0),
        ]);
        fail("This should throw an assertion error!");
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });
  });
}
