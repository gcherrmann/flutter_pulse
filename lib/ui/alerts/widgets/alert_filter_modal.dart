import 'package:flutter/material.dart';
import 'package:flutter_template/ui/alerts/view_model/alert_view_model.dart';
import 'package:flutter_template/ui/core/extensions/datetime_extension.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/core/types/types.dart';
import 'package:flutter_template/ui/core/ui/pulse_filled_button.dart';
import 'package:flutter_template/ui/core/ui/pulse_picker.dart';
import 'package:flutter_template/utils/functions.dart';

class AlertFilterModal extends StatefulWidget {
  final AlertViewModel _viewModel;

  AlertFilterModal({
    super.key,
    required AlertViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  State<AlertFilterModal> createState() => _AlertFilterModalState();
}

class _AlertFilterModalState extends State<AlertFilterModal> {
  DateTime? _initialDate;
  DateTime? _finalDate;

  @override
  void initState() {
    super.initState();
    var viewModel = widget._viewModel;
    if (viewModel.initialDate != null) {
      _initialDate = viewModel.initialDate!.clone();
    }
    if (viewModel.finalDate != null) {
      _finalDate = viewModel.finalDate!.clone();
    }
  }

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
              widget._viewModel.setFilter(_initialDate, _finalDate);
              Navigator.pop(context);
            },
            text: "Filtrar",
          ),
        ],
      ),
    );
  }
}
