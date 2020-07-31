import 'package:flutter/material.dart';
import 'providers/map_provider.dart';

/// Implementation of the provider pattern for the [MapProvider] class.
///
/// This [InheritedWidget] will provide an instance of [MapProvider] to
/// all his children.
class FMapsProvider extends InheritedWidget {
  /// Instance of [MapProvider] to provide to the children.
  final MapProvider provider;

  const FMapsProvider({
    Key key,
    @required this.provider,
    @required Widget child,
  })  : assert(provider != null, "The given MapProvider must be not null!"),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(FMapsProvider oldWidget) {
    return provider != oldWidget.provider;
  }

  /// Returns the instance of [MapProvider] present in the widget tree.
  /// If no [MapProvider] is present null will be returned instead.
  static MapProvider of(BuildContext context) {
    assert(context != null);
    return context.dependOnInheritedWidgetOfExactType<FMapsProvider>()?.provider;
  }
}
