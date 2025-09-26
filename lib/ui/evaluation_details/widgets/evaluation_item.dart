import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class EvaluationItem extends StatelessWidget {
  final String _title;
  final String _value;
  const EvaluationItem({
    super.key,
    required String title,
    required String value,
  }) : _title = title,
       _value = value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _title,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              color: AppColors.primaryFontColor,
            ),
          ),
          Text(
            _value,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
              color: AppColors.primaryFontColor.withValues(
                alpha: 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
