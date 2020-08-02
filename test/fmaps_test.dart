import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fmaps/fmaps.dart';
import 'package:fmaps/src/fmaps_widget.dart';
import 'package:fmaps/src/placeholder.dart';

void main() {
  group("FMaps Test", () {
    testWidgets("create FMaps with null options throws an assertion error",
        (tester) async {
      try {
        await tester.pumpWidget(FMaps(
          options: null,
        ));
        fail("Create an FMaps with null options should not be possible!");
      } on AssertionError catch (e) {
        expect(e.toString(), contains("options != null"));
      }
    });

    testWidgets(
        "create FMaps with null provider throws an assertion error during build",
        (tester) async {
      await tester.pumpWidget(FMaps(
        options: MapOptions(
          center: LatLng(0.0, 0.0),
          zoom: 19.0,
        ),
      ));
      expect(tester.takeException(), isA<AssertionError>());
    });

    testWidgets("create FMaps show the map correctly", (tester) async {
      await tester.pumpWidget(FMaps(
        options: MapOptions(
          center: LatLng(0.0, 0.0),
          zoom: 19.0,
        ),
        provider: MockMapProvider(),
      ));

      await tester.pumpAndSettle();

      expect(
        tester.firstWidget<Image>(find.byType(Image)).image,
        isA<MemoryImage>(),
      );
    });
  });
}

class MockMapProvider extends MapProvider {
  @override
  ImageProvider getStaticMap(int width, int height, MapOptions options) {
    final p = Base64Decoder().convert(placeholderBase64String);
    return MemoryImage(p);
  }
}
