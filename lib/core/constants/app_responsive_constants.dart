import 'package:flutter/material.dart';

/// A utility class that defines responsive breakpoints and provides methods
/// to determine the type of device based on the screen width.
///
/// The breakpoints are defined as follows:
/// - `mobileBreakpoint`: The maximum width for mobile devices.
/// - `tabletBreakpoint`: The maximum width for tablet devices.
///
/// Methods:
/// - `isMobile(BuildContext context)`: Returns `true` if the given width is less than the mobile breakpoint.
/// - `isTablet(BuildContext context)`: Returns `true` if the given width is between the mobile and tablet breakpoints.
/// - `isDesktop(BuildContext context)`: Returns `true` if the given width is greater than or equal to the tablet breakpoint.
/// - `isMobile(double width)`: Returns `true` if the given width is less than the mobile breakpoint.
/// - `isTablet(double width)`: Returns `true` if the given width is between the mobile and tablet breakpoints.
/// - `isDesktop(double width)`: Returns `true` if the given width is greater than or equal to the tablet breakpoint.
class AppResponsiveConstants {
  static const double mobileBreakpoint = 650;
  static const double tabletBreakpoint = 1024;

  static bool isMobile(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tabletBreakpoint;
  }
}
