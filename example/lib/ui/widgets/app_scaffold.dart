import 'package:app_stack/app_stack.dart';
import 'package:app_stack/core/ui/widgets/app_menu_drawer.dart';
import 'package:example/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: false,
        actions: [
          AppUserAvatar(),
        ],
      ),
      appMenuDrawer: AppMenuDrawer(
        logo: Image.asset(
          AssetConstants.logo,
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
