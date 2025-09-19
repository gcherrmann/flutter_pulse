import 'package:flutter/material.dart';
import 'package:flutter_template/ui/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:flutter_template/ui/forgot_password/widgets/forgot_password_screen.dart';
import 'package:flutter_template/ui/login/view_model/login_view_model.dart';
import 'package:flutter_template/ui/login/widgets/login_screen.dart';
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
};
