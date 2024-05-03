import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/auth/presentation/pages/forget_password_page.dart';
import 'package:sakan/features/auth/presentation/pages/forgot_password_verivacation_page.dart';
import 'package:sakan/features/auth/presentation/pages/login_page.dart';
import 'package:sakan/features/auth/presentation/pages/register_page.dart';
import 'package:sakan/features/main/presentation/pages/main_pages/home_page.dart';
import 'package:sakan/features/main/presentation/pages/main_pages/services_page.dart';
import 'package:sakan/features/main/presentation/pages/sevices_pages/bread_request_page.dart';

var routes = {
  loginPage: (context) => const LoginPage(),
  registerPage: (context) => const RegisterPage(),
  forgotPasswordPage: (context) => ForgotPasswordPage(),
  forgotPasswwordVerificationPage: (context) =>
      const ForgotPasswordVerificationPage(),
  homePage: (context) => const HomePage(),
  breadRequestPage: (context) => const BreadRequestPage(),
  sevicesPage: (context) => const ServicesPage(),
};
