import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.mobileBreakpoint = 800,
    this.tabletBreakpoint = 1200,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  final int mobileBreakpoint;
  final int tabletBreakpoint;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if (screenSize.width > tabletBreakpoint) {
      return desktop;
    } else if (screenSize.width > mobileBreakpoint) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
