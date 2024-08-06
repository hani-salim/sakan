//this is constant file

import 'package:flutter/material.dart';
import 'package:sakan/core/colors/colors.dart';
import 'package:sakan/features/auth/data/models/user.dart';
import 'package:sakan/features/auth/data/models/user_detailes.dart';
import 'package:sakan/features/auth/domain/entities/user.dart';
import 'package:sakan/features/student/domain/entities/service_entities.dart';
import 'package:sakan/features/student/domain/entities/theme_entities.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/about_us_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/help_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/log_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/news_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/notification_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/profile_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/services_page.dart';
import 'package:sakan/features/student/presentation/pages/main_pages/settings_page.dart';

//api
const String baseUrl = "https://mhmd26221.pythonanywhere.com/api/";

//header widget height

//pages for routes
const String loginPage = "LoginPage";
const String registerPage = "RegisterPage";
const String forgotPasswordPage = "forgotPasswordPage";
const String forgotPasswwordVerificationPage =
    "forgotPasswwordVerificationPage";
const String homePage = "homePage";
const String sevicesPage = "servicesPage";
const String complaintPage = "complaintPage";
const String workPermitPage = "workPermitPage";
const String repaireRequestPage = "repaireRequestPage";
const String registerOnSakanDetailesPage= "registerOnSakanDetailesPage";
const String settingsPage= "settingsPage";
const String registerOnSakanPage= "registerOnSakanPage";

//constant
const String validate = "❗❗ حقل مطلوب";
const String errorMessage= "خطأ في الاتصال في الانترنيت";

const int currentIndex = 0;
const double iconAppBarSize = 30;

//list of services
const double height = 100;
List<ServiceEntities> services = [
  ServiceEntities(
      color: Colors.greenAccent,
      title: "طلب الحصول على خبز",
      url: 'assets/images/bread.png',
      isTapped: false,
      height: height),
  ServiceEntities(
      color: const Color(0xFFFFC107),
      title: "تقديم إذن عمل",
      url: 'assets/images/job.png',
      isTapped: false,
      height: height),
  ServiceEntities(
      color: Colors.indigoAccent,
      title: "تقديم طلب صيانة",
      url: 'assets/images/malfunction.png',
      isTapped: false,
      height: height),
  ServiceEntities(
      color: Colors.redAccent,
      title: "تقديم شكوى",
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
  SettingsPage(),
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

//user
  UserEntities? user ;
  
  //list of user detailes
  List<UserDetailes> userDetailes=[
    UserDetailes(leading:const Icon(Icons.title), title: 'الاسم الأول', subtitle: '${user!.firstName}'),
    UserDetailes(leading:const Icon(Icons.title), title: 'الاسم الأخير', subtitle: '${user!.lastName}'),
    UserDetailes(leading:const Icon(Icons.title), title: 'اسم الأم', subtitle: '${user!.motherName}'),
    UserDetailes(leading:const Icon(Icons.title), title: 'الاسم الأب', subtitle: '${user!.fatherName}'),
    UserDetailes(leading:const Icon(Icons.phone_android), title: 'رقم الهاتف', subtitle: '${user!.phoneNumber}'),
    UserDetailes(leading:const Icon(Icons.numbers), title: 'رقم الهوية الوطني', subtitle: '${user!.idNationalNumber}'),
    UserDetailes(leading:const Icon(Icons.home_max_outlined), title: 'الجامعة', subtitle: '${user!.university}'),
    UserDetailes(leading:const Icon(Icons.home_outlined), title: 'الكلية', subtitle: '${user!.faculty}'),
    UserDetailes(leading:const Icon(Icons.engineering_outlined), title: 'الاختصاص', subtitle: '${user!.section}'),
    UserDetailes(leading:const Icon(Icons.home), title: 'رقم الوحدة', subtitle: '${user!.unitNumber}'),
    UserDetailes(leading:const Icon(Icons.room), title: 'رقم الغرفة', subtitle: '${user!.roomNumber}'),
    UserDetailes(leading:const Icon(Icons.location_city), title: 'المدينة', subtitle: '${user!.city}'),
    UserDetailes(leading:const Icon(Icons.history), title: 'السنة الدراسية', subtitle: '${user!.year}'),
    UserDetailes(leading:const Icon(Icons.work), title: 'العمل', subtitle: '${user!.job}'),
  ];