import 'package:flutter/material.dart';
import 'package:flutter_template/models/evaluation_model.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/utils/functions.dart';

class EvaluationCard extends StatelessWidget {
  final EvaluationModel _model;

  const EvaluationCard({super.key, required EvaluationModel model})
    : _model = model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 8),

      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.white,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 14,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _model.statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                _model.label,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  color: AppColors.boldFontColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _model.name,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: AppColors.boldFontColor50,
                    ),
                  ),
                  Text(
                    _model.name,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: AppColors.boldFontColor,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    "Data",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: AppColors.boldFontColor50,
                    ),
                  ),
                  Text(
                    Functions.formatDate(_model.date),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: AppColors.boldFontColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
