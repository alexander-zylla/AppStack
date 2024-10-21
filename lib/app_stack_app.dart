import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'core/feature/app_feature.dart';

class AppStackApp extends StatefulWidget {
  AppStackApp({
    super.key,
    this.additionalRoutes = const [],
    required this.features,
  }) {
    usePathUrlStrategy();
  }

  final List<RouteBase> additionalRoutes;
  final List<AppFeature> features;

  static AppStackApp of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<AppStackApp>()!;
  }

  @override
  State<AppStackApp> createState() => _AppStackAppState();
}

class _AppStackAppState extends State<AppStackApp> {
  late final GoRouter _router = GoRouter(
    routes: [
      ...widget.additionalRoutes,
      ...widget.features.expand((feature) => feature.routes),
    ],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
