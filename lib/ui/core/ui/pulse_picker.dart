import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_template/ui/core/themes/app_colors.dart';

class PulsePicker extends StatelessWidget {
  final String _label;
  final String _placeHolder;
  final String _iconPath;
  final double _iconSize;
  final VoidCallback _action;
  final Color _iconColor;

  const PulsePicker({
    super.key,
    required String label,
    required String placeHolder,
    required String iconPath,
    required double iconSize,
    required VoidCallback action,
    required Color iconColor,
  }) : _label = label,
       _placeHolder = placeHolder,
       _iconPath = iconPath,
       _iconSize = iconSize,
       _action = action,
       _iconColor = iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          _label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            color: AppColors.boldFontColor,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            side: BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
          onPressed: _action,
          child: Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _placeHolder,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: AppColors.placeHolderColor,
                  ),
                ),
                SvgPicture.asset(
                  _iconPath,
                  width: _iconSize,
                  colorFilter: ColorFilter.mode(
                    _iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
