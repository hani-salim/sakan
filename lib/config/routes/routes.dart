import '../../features/student/presentation/pages/main_pages/settings_page.dart';
import '../../features/student/presentation/pages/registere%20_on_sakan_pages/register_detailes_page.dart';
import '../../features/student/presentation/pages/registere%20_on_sakan_pages/register_on_sakan_page.dart';
import '../../features/student/presentation/pages/sevices_pages/complaint_page.dart';
import '../../features/student/presentation/pages/sevices_pages/repaire_request_page.dart';
import '../../features/student/presentation/pages/sevices_pages/work_permit_page.dart';

import '../../core/constant/constant.dart';
import '../../features/auth/presentation/pages/forget_password_page.dart';
import '../../features/auth/presentation/pages/forgot_password_verivacation_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/student/presentation/pages/main_pages/home_page.dart';
import '../../features/student/presentation/pages/main_pages/services_page.dart';
import '../../features/student/presentation/pages/sevices_pages/bread_request_page.dart';

var routes = {
  loginPage: (context) => const LoginPage(),
  registerPage: (context) => const RegisterPage(),
  forgotPasswordPage: (context) => ForgotPasswordPage(),
  forgotPasswwordVerificationPage: (context) =>
      const ForgotPasswordVerificationPage(),
  homePage: (context) => const HomePage(),
  breadRequestPage: (context) => const BreadRequestPage(),
  sevicesPage: (context) => const ServicesPage(),
  workPermitPage: (context) => const WorkPermitPage(),
  complaintPage: (context) => const ComplaintPage(),
  repaireRequestPage: (context) => const RepaireRequestPage(),
  registerOnSakanDetailesPage: (context) => const RegisterOnSakanDetailesPage(),
  settingsPage: (context) => const SettingsPage(),
  registerOnSakanPage: (context) => const RegisterOnSakanPage(),
};
