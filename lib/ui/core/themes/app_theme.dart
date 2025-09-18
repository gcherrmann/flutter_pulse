import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColors.red,
    primaryColorDark: AppColors.red,
    primaryColorLight: AppColors.red,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.red),
  );
}
