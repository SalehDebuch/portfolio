import 'package:flutter/material.dart';
import 'package:protfolio/utils/constants.dart';
import 'package:protfolio/utils/globals.dart';
import 'package:protfolio/view/carousel.dart';
import 'package:protfolio/view/cv_section.dart';
import 'package:protfolio/view/first_app_ad.dart';
import 'package:protfolio/view/first_dashboard_ad.dart';
import 'package:protfolio/view/footer.dart';
import 'package:protfolio/view/header.dart';
import 'package:protfolio/view/portfolio_stats.dart';
import 'package:protfolio/view/second_app_ad.dart';
import 'package:protfolio/view/skill_section.dart';
import 'package:protfolio/view/testimonial_widget.dart';
import 'package:protfolio/view/website_ad.dart';

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
            const SizedBox(
              height: 70.0,
            ),

            const FirstAppAd(),
            const SizedBox(
              height: 70.0,
            ),
            const FirstDashboardAd(),
            const SizedBox(
              height: 70.0,
            ),
            const SecondAppAd(),
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
            // const Sponsors(),
            // const SizedBox(
            //   height: 50.0,
            //),
            const TestimonialWidget(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
