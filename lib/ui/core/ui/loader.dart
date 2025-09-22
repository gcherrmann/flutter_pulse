import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.2),

      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.transparent,
            child: CircularProgressIndicator(
              color: AppColors.green,
            ),
          ),
        ),
      ),
    );
  }
}
