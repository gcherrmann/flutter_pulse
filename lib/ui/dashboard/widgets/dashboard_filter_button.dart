import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class DashboardFilterButton extends StatelessWidget {
  final String _label;
  final String _iconPath;
  final VoidCallback _action;

  const DashboardFilterButton({
    super.key,
    required String label,
    required String iconPath,
    required VoidCallback action,
  }) : _label = label,
       _iconPath = iconPath,
       _action = action;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: _action,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
      child: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(_iconPath),
          Text(
            _label,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              color: AppColors.primaryFontColor,
            ),
          ),
        ],
      ),
    );
  }
}
