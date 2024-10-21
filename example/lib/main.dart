import 'dart:ui_web';

import 'package:app_stack/app_stack.dart';
import 'package:app_stack/app_stack_app.dart';
import 'package:example/core/theme/app_theme.dart';
import 'package:example/ui/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStackApp(
      features: [
        AppAuthFeature(),
      ],
      additionalRoutes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DashBoardPage(),
        ),
      ],
    );
  }
}
