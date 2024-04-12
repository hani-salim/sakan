//this is constant file

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/features/main/domain/entities/service_item.dart';
import 'package:sakan/features/main/domain/entities/theme_item.dart';
import 'package:sakan/features/main/presentation/pages/about_us_page.dart';
import 'package:sakan/features/main/presentation/pages/help_page.dart';
import 'package:sakan/features/main/presentation/pages/log_page.dart';
import 'package:sakan/features/main/presentation/pages/news_page.dart';
import 'package:sakan/features/main/presentation/pages/notification_page.dart';
import 'package:sakan/features/main/presentation/pages/profile_page.dart';
import 'package:sakan/features/main/presentation/pages/services.dart';
import 'package:sakan/features/main/presentation/pages/setting_page.dart';

//api
const String baseUrl = "http://10.0.2.2:8000/api/";
// const String baseUrl = "http://127.0.0.1:8000/api/";

//pages
const String loginPage = "LoginPage";
const String registerPage = "RegisterPage";
const String forgotPasswordPage = "forgotPasswordPage";
const String forgotPasswwordVerificationPage =
    "forgotPasswwordVerificationPage";
const String homePage = "homePage";

//constant
const String validate = "❗❗ حقل مطلوب";
const int currentIndex = 0;
const double iconAppBarSize = 30;

//list of services
const double height = 100;
List<ServiceEntities> services = [
  ServiceEntities(
      color: Colors.greenAccent,
      title: "a",
      url: 'assets/images/bread.png',
      isTapped: false,
      height: height),
  ServiceEntities(
      color: const Color(0xFFFFC107),
      title: "b ",
      url: 'assets/images/job.png',
      isTapped: false,
      height: height),
  ServiceEntities(
      color: Colors.indigoAccent,
      title: "c ",
      url: 'assets/images/malfunction.png',
      isTapped: false,
      height: height),
  ServiceEntities(
      color: Colors.redAccent,
      title: "d",
      url: 'assets/images/complaint.png',
      isTapped: false,
      height: height),
];

//list of themes
List<ThemeEntities> themes = [
  ThemeEntities(
      primaryColor: HexColor("#cc2b5e"), secondaryColor: HexColor('#753a88')),
  ThemeEntities(
      primaryColor: HexColor("#ee9ca7"), secondaryColor: HexColor('#ffdde1')),
ThemeEntities(
      primaryColor: HexColor("#eb3349"), secondaryColor: HexColor('#f45c43 ')),
  ThemeEntities(
      primaryColor: HexColor("#56ab2f"), secondaryColor: HexColor('#a8e063')),
  ThemeEntities(
      primaryColor: HexColor("#02aab0"), secondaryColor: HexColor('#00cdac')),
  ThemeEntities(
      primaryColor: HexColor("#000428"), secondaryColor: HexColor('#004e92')),
  ThemeEntities(
      primaryColor: HexColor("#7b4397"), secondaryColor: HexColor('#dc2430')),
  ThemeEntities(
      primaryColor: HexColor("#ff512f"), secondaryColor: HexColor('#dd2476')),
];
//main card
ServiceEntities mainCard = ServiceEntities(
    color: MyColors.primaryColor,
    title: 'التسجيل على السكن',
    isTapped: false,
    url: 'assets/images/bread.png',
    height: 100);

//pages and titles for bottom navication bar and drawer

List pages = const [
  ProfilePage(),
  LogPage(),
  ServicesPage(),
  NewsPage(),
  SettingPage(),
  NotificationPage(),
  HelpPage(),
  AboutUsPage()
];

final List<String> titles = [
  "الملف الشخصي",
  "السجل",
  "الخدمات",
  "الأخبار",
  "الإعدادات",
  "الإشعارات",
  "مساعدة",
  "حول التطبيق",
];
