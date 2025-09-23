import 'package:flutter/material.dart';
import 'package:flutter_template/ui/dashboard/view_model/dashboard_view_model.dart';
import 'package:flutter_template/ui/dashboard/widgets/dashboard_screen.dart';
import 'package:flutter_template/ui/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:flutter_template/ui/forgot_password/widgets/forgot_password_screen.dart';
import 'package:flutter_template/ui/login/view_model/login_view_model.dart';
import 'package:flutter_template/ui/login/widgets/login_screen.dart';
import 'package:flutter_template/ui/tab_screen/view_model/tab_view_model.dart';
import 'package:flutter_template/ui/tab_screen/widgets/tab_screen.dart';
import 'package:flutter_template/ui/terms_of_use/view_model/terms_of_use_view_model.dart';
import 'package:flutter_template/ui/terms_of_use/widgets/terms_of_use_screen.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => ChangeNotifierProvider(
    create: (_) => LoginViewModel(),
    child: LoginScreen(),
  ),
  '/forgotpassword': (context) => ChangeNotifierProvider(
    create: (_) => ForgotPasswordViewModel(),
    child: ForgotPasswordScreen(),
  ),
  'terms-of-service': (context) => ChangeNotifierProvider(
    create: (_) => TermsOfUseViewModel(),
    child: TermsOfUseScreen(),
  ),
  '/dashboard': (context) => ChangeNotifierProvider(
    create: (_) => DashboardViewModel(),
    child: DashboardScreen(),
  ),
  '/tabs': (context) => ChangeNotifierProvider(
    create: (_) => TabViewModel(),
    child: TabScreen(),
  ),
};

final List<Widget> appTabs = [
  ChangeNotifierProvider(
    create: (_) => DashboardViewModel(),
    child: DashboardScreen(),
  ),
  ChangeNotifierProvider(
    create: (_) => DashboardViewModel(),
    child: DashboardScreen(),
  ),
  ChangeNotifierProvider(
    create: (_) => DashboardViewModel(),
    child: DashboardScreen(),
  ),
];
