import 'package:app_stack/app_stack_app.dart';
import 'package:flutter/material.dart';

/// A widget that represents a menu drawer with a list of items and an optional logo.
///
/// The [AppMenuDrawer] requires at least 2 items in the [items] list.
///
/// The [items] parameter is a list of [AppMenuDrawerItem] which defines the
/// individual items in the drawer. Each item includes a title, an icon, a
/// selection state, and an optional tap callback.
///
/// The [logo] parameter is an optional widget that can be displayed at the top
/// of the drawer.
///
/// The drawer's background color and selected tile color are derived from the
/// current theme's color scheme.
class AppMenuDrawer extends StatelessWidget {
  const AppMenuDrawer({
    super.key,
    required this.items,
    this.logo,
  }) : assert(items.length >= 2, 'items must have at least 2 items');

  final List<AppMenuDrawerItem> items;
  final Widget? logo;

  Widget itemToTile(BuildContext context, AppMenuDrawerItem item) {
    return ListTile(
      title: item.title,
      leading: item.icon,
      selected: item.selected,
      onTap: item.onTap,
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: ListView(
        primary: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          if (logo != null)
            Container(
              padding: const EdgeInsets.all(32.0),
              child: logo,
            ),
          ...items.map((item) => itemToTile(context, item)),
          ...AppStackApp.of(context)
              .features
              .where((element) => element.drawerItem != null)
              .map(
                (e) => itemToTile(context, e.drawerItem!),
              )
        ],
      ),
    );
  }
}

/// A class representing an item in the app menu drawer.
///
/// This class holds the properties for an individual item in the app menu drawer,
/// including its title, icon, selection state, and an optional tap callback.
///
/// Properties:
/// - `title` (Widget): The title of the menu item.
/// - `icon` (Widget): The icon of the menu item.
/// - `selected` (bool): Indicates whether the menu item is selected. Defaults to `false`.
/// - `onTap` (VoidCallback?): An optional callback that is triggered when the menu item is tapped.
class AppMenuDrawerItem {
  AppMenuDrawerItem({
    required this.title,
    required this.icon,
    this.selected = false,
    this.onTap,
  });

  final Widget title;
  final Widget icon;
  final bool selected;
  final VoidCallback? onTap;
}
