import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_portfolio/models/header_item.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:flutter_portfolio/utils/globals.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';

import '../controllers/scroll_helper.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "HOME",
    onTap: () {},
  ),
  HeaderItem(
      title: "MY INTRO",
      onTap: () {
        ScrollHelper.scrollTo(Globals.cvSectionKey);
      }),
  HeaderItem(
      title: "MY PROJECTS",
      onTap: () {
        ScrollHelper.scrollTo(Globals.iosKey);
      }),
  // HeaderItem(
  //     title: "EXPERINCES",
  //     onTap: () {
  //       ScrollHelper.scrollTo(Globals.educationKey);
  //     }),
  HeaderItem(
      title: "Skills",
      onTap: () {
        ScrollHelper.scrollTo(Globals.skillsKey);
      }),
  HeaderItem(
      isButton: false,
      title: "TESTIMONIALS",
      onTap: () {
        ScrollHelper.scrollTo(Globals.testimonialKey);
      }),
  HeaderItem(
    title: "HIRE ME",
    onTap: () {
      ScrollHelper.scrollTo(Globals.fotterKey);
    },
    isButton: true,
  ),
];

// This widget represents the entire header of the app.
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  // This method returns the mobile version of the header.
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              onTap: () {
                // Open the drawer using the global scaffold key.
                Globals.scaffoldKey.currentState.openEndDrawer();
              },
              child: Icon(
                FlutterIcons.menu_fea,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // This method returns the header for desktop and tablet devices.
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(), // Add the header row to the header.
        ],
      ),
    );
  }
}

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.headerKey,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "S",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// This widget represents a row of items in the header of the app.
class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      // This header row is only visible when the screen is larger than a mobile device.
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      // This row contains a list of header items, which can be either text or buttons.
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      // Add a click cursor to button items.
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      // Add a click cursor to non-button items.
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: InkWell(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}
