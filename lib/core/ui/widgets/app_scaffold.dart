import 'package:app_stack/core/constants/app_responsive_constants.dart';
import 'package:app_stack/core/ui/widgets/app_responsive.dart';
import 'package:flutter/material.dart';

/// A custom scaffold widget that adapts to different screen sizes and
/// optionally includes a drawer menu.
///
/// The [AppScaffold] widget is designed to provide a consistent layout
/// for the application across mobile, tablet, and desktop devices. It
/// includes an optional drawer menu that is displayed on mobile and
/// tablet devices, and as a side panel on desktop devices.
///
/// The widget uses the [AppResponsive] widget to determine the screen
/// size and adjust the layout accordingly.
///
/// The [appMenuDrawer] parameter is a widget that will be used as the
/// content of the drawer menu. If it is not provided, the drawer menu
/// will not be displayed.
///
/// The [body] parameter is the main content of the scaffold.
///
/// Example usage:
/// ```dart
/// AppScaffold(
///   appMenuDrawer: MyDrawerWidget(),
///   body: MyBodyWidget(),
/// )
/// ```
///
/// See also:
/// - [Scaffold], which is used to create the basic layout structure.
/// - [AppResponsive], which is used to determine the screen size.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    this.appMenuDrawer,
    this.body,
  });

  final PreferredSizeWidget? appBar;
  final Widget? appMenuDrawer;
  final Widget? body;

  bool hasAppMenuDrawer(BuildContext context) {
    return appMenuDrawer != null &&
        (AppResponsiveConstants.isMobile(context) ||
            AppResponsiveConstants.isTablet(context));
  }

  Widget _appScaffold(BuildContext context) {
    return Scaffold(
      drawer: hasAppMenuDrawer(context) ? Drawer(child: appMenuDrawer) : null,
      appBar: appBar,
      body: body,
    );
  }

  Widget _appMenuDrawerWrapper(BuildContext context, Widget child) {
    return Row(
      children: [
        if (appMenuDrawer != null)
          SizedBox.fromSize(
            size: const Size.fromWidth(300),
            child: appMenuDrawer!,
          ),
        Expanded(flex: 4, child: child),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppResponsive(
      isMobile: (context) {
        return _appScaffold(context);
      },
      isTablet: (context) {
        return _appScaffold(context);
      },
      isDesktop: (context) {
        return _appMenuDrawerWrapper(
          context,
          _appScaffold(context),
        );
      },
    );
  }
}
