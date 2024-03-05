import 'package:sakan/core/constant/constant.dart';
import 'package:sakan/features/auth/presentation/pages/forget_password.dart';
import 'package:sakan/features/auth/presentation/pages/forgot_password_verivacation.dart';
import 'package:sakan/features/auth/presentation/pages/login.dart';
import 'package:sakan/features/auth/presentation/pages/register.dart';

var routes = {
  loginScreen: (context) => const LoginScreen(),
  registerScreen: (context) => const RegisterScreen(),
  forgotPasswordScreen: (context) => ForgotPasswordScreen(),
  forgotPasswwordVerificationScreen: (context) =>
      const ForgotPasswordVerificationPage()
};
