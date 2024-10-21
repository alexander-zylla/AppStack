import 'package:app_stack/core/constants/app_responsive_constants.dart';
import 'package:flutter/material.dart';

/// A responsive widget that builds different layouts based on the screen width.
///
/// The [AppResponsive] widget takes three [WidgetBuilder] parameters:
/// [isMobile], [isTablet], and [isDesktop], which correspond to the layouts
/// for mobile, tablet, and desktop screen sizes respectively.
///
/// The widget uses the screen width to determine which layout to display:
/// - If the screen width matches the mobile criteria, it builds the [isMobile] layout.
/// - If the screen width matches the tablet criteria, it builds the [isTablet] layout.
/// - Otherwise, it builds the [isDesktop] layout.
///
/// The criteria for determining the screen size are defined in the
/// [AppResponsiveConstants] class.
///
/// Example usage:
/// ```dart
/// AppResponsive(
///   isMobile: (context) => MobileLayout(),
///   isTablet: (context) => TabletLayout(),
///   isDesktop: (context) => DesktopLayout(),
/// );
/// ```
class AppResponsive extends StatelessWidget {
  const AppResponsive({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
  });

  final WidgetBuilder isMobile;
  final WidgetBuilder isTablet;
  final WidgetBuilder isDesktop;

  @override
  Widget build(BuildContext context) {
    if (AppResponsiveConstants.isMobile(context)) {
      return isMobile(context);
    } else if (AppResponsiveConstants.isTablet(context)) {
      return isTablet(context);
    } else {
      return isDesktop(context);
    }
  }
}
