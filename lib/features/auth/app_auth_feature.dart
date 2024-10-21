import 'package:app_stack/core/feature/app_feature.dart';
import 'package:app_stack/core/ui/widgets/app_menu_drawer.dart';
import 'package:app_stack/features/auth/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppAuthFeature implements AppFeature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const Text('Login'),
        ),
        GoRoute(
          name: 'register',
          path: '/register',
          builder: (context, state) => const Text('register'),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ];

  @override
  AppMenuDrawerItem? get drawerItem => AppMenuDrawerItem(
        title: Text('Profile'),
        icon: Icon(Icons.portable_wifi_off_outlined),
      );
}
