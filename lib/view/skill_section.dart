import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/skill.dart';



import '../../../utils/constants.dart';
import '../../../utils/globals.dart';
import '../../../utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "Flutter, Dart, GetX, Provider",
    percentage: 90,
  ),
  Skill(
    skill: "Laravel,API, PHP,Firebase",
    percentage: 80,
  ),
  Skill(
    skill: "MySQL, SQL, MongoDB",
    percentage: 80,
  ),
  Skill(
    skill: "Google Play, Appstore, Servers",
    percentage: 80,
  ),
  Skill(
    skill: "Pythone, Neural Network",
    percentage: 70,
  ),
  Skill(
    skill: "Problem solving, Team work, Communication",
    percentage: 90,
  ),
  Skill(
    skill: "HTML, CSS, JavaScript",
    percentage: 60,
  ),
];

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      key: Globals.skillsKey,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                //  Expanded(
                //     flex: ScreenHelper.isMobile(context) ? 0 : 2,
                // child: CircleAvatar(
                //   radius: 100,
                //   backgroundColor: Colors.transparent,
                //   child: ClipOval(
                //     child: Image.asset(
                //       'assets/person.png',
                //       fit: BoxFit
                //           .contain, // This will fit the image within the circle without cropping
                //     ),
                //   ),
                // ),
                //   ),
                const SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SKILLS",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "The skills listed below are a testament to my expertise, with ongoing additions in the pipeline",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: const EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        color: Colors.white,
                                        child: Text(skill.skill),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: const Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
