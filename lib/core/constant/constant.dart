//this is constant file

import 'package:flutter/material.dart';
import 'package:sakan/features/services/presentation/pages/services.dart';

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

//buttom nivacation bar
const List<String> titles = [
  'الملف الشخصي',
  'الأخبار',
  'الخدمات',
  'السجل',
  'الإعدادات',
];
const List<Widget> screens = [
  // ProfileImageScreen(),
  // NewsScreen(),
  ServicesPage(),
  // HistoryScreen(),
  // SettingScreen()
];
