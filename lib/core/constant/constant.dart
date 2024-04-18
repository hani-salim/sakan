//this is constant file

import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/features/main/domain/entities/card_detailes_item.dart';
import 'package:sakan/features/main/domain/entities/service_item.dart';
import 'package:sakan/features/main/domain/entities/theme_item.dart';
import 'package:sakan/features/main/presentation/pages/about_us_page.dart';
import 'package:sakan/features/main/presentation/pages/help_page.dart';
import 'package:sakan/features/main/presentation/pages/log_page.dart';
import 'package:sakan/features/main/presentation/pages/news_page.dart';
import 'package:sakan/features/main/presentation/pages/notification_page.dart';
import 'package:sakan/features/main/presentation/pages/profile_page.dart';
import 'package:sakan/features/main/presentation/pages/services_page.dart';
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
  ThemeEntities(primaryColor: ("#00ff08"), secondaryColor: ('#1f2b1f')),
  ThemeEntities(primaryColor: ("#ff05e2"), secondaryColor: ('#0e1469')),
  ThemeEntities(primaryColor: ("#000428"), secondaryColor: ('#004e92')),
  ThemeEntities(primaryColor: ("#00f2ff"), secondaryColor: ('#ba0d0d')),
  ThemeEntities(primaryColor: ("#ff6600"), secondaryColor: ('#9af21f')),
  ThemeEntities(primaryColor: ("#9000ff"), secondaryColor: ('#3e1880')),
  ThemeEntities(primaryColor: ("#4c5224"), secondaryColor: ('#d4cd11')),
  ThemeEntities(primaryColor: ("#ff0026"), secondaryColor: ('#0022ff')),
  ThemeEntities(primaryColor: ("#05ff1a"), secondaryColor: ('#ff7b00')),
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
//list of card detailes
List<CardDetailesEntities> listTiles = [
  CardDetailesEntities(
      title: 'العنوان',
      subTiltle: 'الشيخ بدر',
      leading: const Icon(Icons.room)),
  CardDetailesEntities(
      title: 'البريد الإلكتروني',
      subTiltle: 'hanisalm@gmail.com',
      leading: const Icon(Icons.email)),
  CardDetailesEntities(
      title: 'رقم الهاتف',
      subTiltle: '0982668276',
      leading: const Icon(Icons.phone)),
  CardDetailesEntities(
      title: 'الجامعة',
      subTiltle: 'تشرين',
      leading: const Icon(Icons.location_city)),
  CardDetailesEntities(
      title: 'الوحدة',
      subTiltle: 'الثامنة عشر ذكور (داخل الحرم)',
      leading: const Icon(Icons.house_siding_sharp)),
  CardDetailesEntities(
      title: 'رقم الغرفة',
      subTiltle: '517',
      leading: const Icon(Icons.numbers_rounded)),
  CardDetailesEntities(
      title: 'رقم الغرفة',
      subTiltle: '517',
      leading: const Icon(Icons.numbers_rounded)),
  CardDetailesEntities(
      title: 'رقم الغرفة',
      subTiltle: '517',
      leading: const Icon(Icons.numbers_rounded)),
  CardDetailesEntities(
      title: 'رقم الغرفة',
      subTiltle: '517',
      leading: const Icon(Icons.numbers_rounded)),
  CardDetailesEntities(
      title: 'رقم الغرفة',
      subTiltle: '517',
      leading: const Icon(Icons.numbers_rounded)),
  CardDetailesEntities(
      title: 'رقم الغرفة',
      subTiltle: '517',
      leading: const Icon(Icons.numbers_rounded)),
];
