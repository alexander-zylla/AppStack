import 'package:app_stack/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
      ),
      appMenuDrawer: AppMenuDrawer(
        logo: Image.asset(
          'assets/logo.png',
          height: 32.0,
        ),
        items: [
          AppMenuDrawerItem(
            title: const Text('Dashboard'),
            icon: const Icon(Icons.dashboard),
            onTap: () {},
          ),
          AppMenuDrawerItem(
            title: const Text('Settings'),
            icon: const Icon(Icons.settings),
            selected: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
