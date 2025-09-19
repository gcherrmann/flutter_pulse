import 'package:flutter/material.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class PulseFilledButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _text;

  const PulseFilledButton({
    super.key,
    required VoidCallback onPressed,
    required String text,
  }) : _onPressed = onPressed,
       _text = text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.green,
      ),
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),
    );
  }
}
