//this is constant file

import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/features/main/domain/entities/card_item.dart';
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
const double height = 200;
List<CardEntities> items = [
  CardEntities(
      color: Colors.greenAccent,
      title: "a",
      url: 'assets/images/bread.png',
      isTapped: false,
      height: height),
  CardEntities(
      color: const Color(0xFFFFC107),
      title: "b ",
      url: 'assets/images/job.png',
      isTapped: false,
      height: height),
  CardEntities(
      color: Colors.indigoAccent,
      title: "c ",
      url: 'assets/images/malfunction.png',
      isTapped: false,
      height: height),
  CardEntities(
      color: Colors.redAccent,
      title: "d",
      url: 'assets/images/complaint.png',
      isTapped: false,
      height: height),
];

//main card
CardEntities mainCard = CardEntities(
    color: MyColors.primaryColor,
    title: 'التسجيل على السكن',
    isTapped: false,
    url: 'assets/images/bread.png',
    height: 150);

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
