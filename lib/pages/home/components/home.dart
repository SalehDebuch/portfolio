import 'package:flutter/material.dart';
import 'package:protfolio/pages/home/components/website_ad.dart';

import '../../../utils/constants.dart';
import '../../../utils/globals.dart';
import 'android_app_ad.dart';
import 'carousel.dart';
import 'cv_section.dart';
import 'footer.dart';
import 'header.dart';
import 'ios_app_ad.dart';
import 'portfolio_stats.dart';
import 'skill_section.dart';
import 'sponsors.dart';
import 'testimonial_widget.dart';

final _scrollController = ScrollController();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            Carousel(),
            const SizedBox(
              height: 20.0,
            ),
            const CvSection(),
            const IOSAppAd(),
            const SizedBox(
              height: 70.0,
            ),
            const AndroidAppAd(),
            const SizedBox(
              height: 70.0,
            ),
            const WebsiteAd(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0),
              child: PortfolioStats(),
            ),
            const SizedBox(
              height: 50.0,
            ),
            // EducationSection(),
            //  SizedBox(
            //    height: 50.0,
            //  ),
            const SkillSection(),
            const SizedBox(
              height: 50.0,
            ),
            const Sponsors(),
            const SizedBox(
              height: 50.0,
            ),
            const TestimonialWidget(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
