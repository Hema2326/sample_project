import 'package:flutter/material.dart';

const int largeScreenSize = 1266;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1366;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final Widget customScreen;
  const ResponsiveWidget(
      {Key? key,
        required this.largeScreen,
        required this.mediumScreen,
        required this.smallScreen,
        required this.customScreen})
      : super(key: key);
  static bool isSmallSceenSize(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;
  static bool islargeSceenSize(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;
  static bool ismediumSceenSize(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
          MediaQuery.of(context).size.width < largeScreenSize;
  static bool iscustomSceenSize(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize &&
          MediaQuery.of(context).size.width >= customScreenSize;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double _width = constraints.maxWidth;
        if (_width >= largeScreenSize) {
          return largeScreen;
        } else if (_width < largeScreenSize && _width >= mediumScreenSize) {
          return mediumScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}