import 'package:flutter/material.dart';

// A utility class for handling responsive layout based on screen width
class ScreenHelper extends StatelessWidget {
  final Widget? mobile; // Widget for mobile layout
  final Widget? tablet; // Widget for tablet layout
  final Widget? desktop; // Widget for desktop layout

  // Constructor to initialize the responsive layouts
  const ScreenHelper({Key? key, this.desktop, this.mobile, this.tablet})
      : super(key: key);

  // Function to determine if the screen is in mobile mode
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0;

  // Function to determine if the screen is in tablet mode
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800.0 &&
      MediaQuery.of(context).size.width < 1200.0;

  // Function to determine if the screen is in desktop mode
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // If the screen width is greater than or equal to 1200.0,
        // return the desktop layout. If desktop layout is not provided,
        // return an empty Container.
        if (constraints.maxWidth >= 1200.0) {
          return desktop ?? Container();
        }
        // If the screen width is greater than or equal to 800.0 and less than 1200.0,
        // return the tablet layout. If tablet layout is not provided,
        // return an empty Container.
        else if (constraints.maxWidth >= 800 && constraints.maxWidth < 1200.0) {
          return tablet ?? Container();
        }
        // If the screen width is less than 800.0,
        // return the mobile layout. If mobile layout is not provided,
        // return an empty Container.
        else {
          return mobile ?? Container();
        }
      },
    );
  }
}
