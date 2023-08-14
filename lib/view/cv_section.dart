import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/design_process.dart';
import '../../../utils/constants.dart';
import '../../../utils/globals.dart';
import '../../../utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Design",
    imagePath: "assets/design.png",
    subtitle:
        "Crafting intuitive, user-friendly designs that seamlessly integrate with app functionality.",
  ),
  DesignProcess(
    title: "Develop",
    imagePath: "assets/develop.png",
    subtitle:
        "Bringing app ideas to life with robust, scalable, and high-performance code.",
  ),
  DesignProcess(
    title: "Test",
    imagePath: "assets/write.png",
    subtitle:
        "Ensuring apps meet the highest standards of quality and reliability as a detail-oriented Full-stack developer.",
  ),
  DesignProcess(
    title: "Deploy",
    imagePath: "assets/promote.png",
    subtitle:
        "Expertise in deploying Flutter apps to reach wider audiences, ensuring seamless experiences across devices.",
  )
];

class CvSection extends StatelessWidget {
  const CvSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Globals.cvSectionKey,
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BETTER DESIGN,\nBETTER EXPERIENCES",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  fontSize: 18.0,
                ),
              ),
              GestureDetector(
                onTap: () => launchUrl(url1),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "DOWNLOAD CV",
                    style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return ResponsiveGridView.builder(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                          ScreenHelper.isMobile(context)
                      ? constraints.maxWidth / 2.0
                      : 250.0,
                  // Hack to adjust child height
                  childAspectRatio: ScreenHelper.isDesktop(context)
                      ? 1
                      : MediaQuery.of(context).size.aspectRatio * 1.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            designProcesses[index].imagePath,
                            width: 40.0,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            designProcesses[index].title,
                            style: GoogleFonts.oswald(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        designProcesses[index].subtitle,
                        style: const TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  );
                },
                itemCount: designProcesses.length,
              );
            },
          )
        ],
      ),
    );
  }
}
