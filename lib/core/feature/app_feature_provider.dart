import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_feature.dart';

final appFeatureNotifierProvider = ChangeNotifierProvider((ref) {
  return AppFeatureNotifier();
});

class AppFeatureNotifier extends ChangeNotifier {
  final Map<Type, AppFeature> _features = {};

  void addFeature(AppFeature feature) {
    _features[feature.runtimeType] = feature;
    notifyListeners();
  }

  AppFeature? getFeature<T extends AppFeature>() {
    return _features[T];
  }
}
