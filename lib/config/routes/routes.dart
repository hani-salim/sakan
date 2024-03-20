import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/auth/presentation/pages/forget_password.dart';
import 'package:sakan/features/auth/presentation/pages/forgot_password_verivacation.dart';
import 'package:sakan/features/auth/presentation/pages/login.dart';
import 'package:sakan/features/auth/presentation/pages/register.dart';
import 'package:sakan/features/services/presentation/pages/home_page.dart';

var routes = {
  loginPage: (context) => const LoginPage(),
  registerPage: (context) => const RegisterPage(),
  forgotPasswordPage: (context) => ForgotPasswordPage(),
  forgotPasswwordVerificationPage: (context) =>
      const ForgotPasswordVerificationPage(),
  homePage: (context) => const HomePage(),
};
