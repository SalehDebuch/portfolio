import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/carousel_item_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/globals.dart';
import '../utils/scroll_helper.dart';

List<CarouselItemModel> carouselItems = List.generate(
    5,
    (index) => CarouselItemModel(
        text: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Mobile Application Developer",
              style: GoogleFonts.oswald(
                color: kPrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Text(
              "SALEH\nEL DEBUCH",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Experienced Full-Stack Mobile App Developer based in Dubai with a passion for crafting innovative cross-platform solutions.\nSkilled in Flutter,Laravel and Firebasse to build high-performing native iOS, Android, and web applications.",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.6,
              ),
            ),
            Wrap(
              children: [
                const Text(
                  "Need a full custom app? ",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      " Got a project? Let's talk.",
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 48.0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                ),
                child: Material(
                  color: Colors
                      .transparent, // Make the Material widget transparent
                  child: InkWell(
                    onTap: () {
                      ScrollHelper.scrollTo(Globals.cvSectionKey);
                    },
                    splashColor: Colors.white
                        .withOpacity(0.3), // Customize the splash color
                    hoverColor: Colors.white
                        .withOpacity(0.1), // Customize the hover color
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Center(
                      child: Text(
                        "GET STARTED",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        image: CircleAvatar(
          radius: 150,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              'assets/person.png',
              fit: BoxFit
                  .contain, // This will fit the image within the circle without cropping
            ),
          ),
        )));
