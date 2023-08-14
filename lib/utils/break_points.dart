import 'package:responsive_framework/responsive_framework.dart';

const double kMobileBreakpoint = 450;
const double kTabletBreakpoint = 800;
const double kDesktopBreakpoint = 1200;
// Add more breakpoints as needed

const ResponsiveBreakpoint kMobileResponsiveBreakpoint =
    ResponsiveBreakpoint.resize(kMobileBreakpoint, name: MOBILE);
const ResponsiveBreakpoint kTabletResponsiveBreakpoint =
    ResponsiveBreakpoint.resize(kTabletBreakpoint, name: TABLET);
const ResponsiveBreakpoint kDesktopResponsiveBreakpoint =
    ResponsiveBreakpoint.resize(kDesktopBreakpoint, name: DESKTOP);
// Define more responsive breakpoints as needed
