import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/core/types/types.dart';
import 'package:flutter_template/ui/core/ui/pulse_filled_button.dart';
import 'package:flutter_template/ui/core/ui/pulse_picker.dart';
import 'package:flutter_template/ui/dashboard/view_model/dashboard_view_model.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/utils/functions.dart';

class DashboardFilterModal extends StatefulWidget {
  final PulseFilterCallback _action;

  DashboardFilterModal({super.key, required PulseFilterCallback action})
    : _action = action;

  @override
  State<DashboardFilterModal> createState() => _DashboardFilterModalState();
}

class _DashboardFilterModalState extends State<DashboardFilterModal> {
  String? _filterType;

  DateTime? _initialDate;

  DateTime? _finalDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 24,
        children: [
          PulsePicker(
            label: "Tipo de avaliação",
            placeHolder: "Selecione um tipo de avaliação",
            iconPath: "assets/images/arrow_down.svg",
            iconSize: 12,
            iconColor: AppColors.primaryBlue,
            action: () {},
          ),

          PulsePicker(
            label: "Data final",
            placeHolder: _initialDate == null
                ? "DD/MM/AAAA"
                : Functions.formatDate(_initialDate!),
            iconPath: "assets/images/calendar.svg",
            iconColor: AppColors.green,
            iconSize: 24,
            action: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _initialDate,
                firstDate: DateTime(2025, 1, 1),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null && pickedDate != _initialDate) {
                setState(() {
                  _initialDate = pickedDate;
                });
              }
            },
          ),

          PulsePicker(
            label: "Data final",
            placeHolder: _finalDate == null
                ? "DD/MM/AAAA"
                : Functions.formatDate(_finalDate!),
            iconPath: "assets/images/calendar.svg",
            iconColor: AppColors.green,
            iconSize: 24,
            action: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _finalDate,
                firstDate: DateTime(2025, 1, 1),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null && pickedDate != _finalDate) {
                setState(() {
                  _finalDate = pickedDate;
                });
              }
            },
          ),
          PulseFilledButton(
            onPressed: () {
              widget._action(
                _filterType,
                _initialDate,
                _finalDate,
              );
              Navigator.pop(context);
            },
            text: "Filtrar",
          ),
        ],
      ),
    );
  }
}
