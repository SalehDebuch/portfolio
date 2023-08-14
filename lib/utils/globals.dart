import 'package:flutter/material.dart';

final Uri url1 = Uri.parse('https://saleh.doctordobosh.net/CV/SalehDebuch.pdf');
final Uri url2 = Uri.parse('https://bmi.doctordobosh.net');
final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'saleheldebuch@gmail.com',
);

class Globals {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> firstAppKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> firstDashboard = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> educationKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> fotterKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> secondAppKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> headerKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> testimonialKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> cvSectionKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> skillsKey = GlobalKey<ScaffoldState>();
  static GlobalKey<ScaffoldState> webAppKey = GlobalKey<ScaffoldState>();
}
