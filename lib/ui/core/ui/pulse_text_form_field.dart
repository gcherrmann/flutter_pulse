import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/ui/core/icons/app_icons.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class PulseTextFormField extends StatelessWidget {
  final TextEditingController _controller;
  final FocusNode? focusNode;
  final int _maxLength;
  final bool obscureText;
  final String _label;
  final Widget _icon;
  final List<TextInputFormatter> _formatters;
  final String? Function(String?)? _validator;
  final TextInputType _keyboardType;
  final ValueNotifier<bool> _obscureTextVN;
  final VoidCallback? onEditingComplete;

  PulseTextFormField({
    super.key,
    required TextEditingController controller,
    this.focusNode,
    required int maxLength,
    this.obscureText = false,
    required Widget icon,
    this.onEditingComplete,
    required List<TextInputFormatter> formatters,
    required String label,
    String? Function(String?)? validator,
    required TextInputType keyboardType,
  }) : _controller = controller,

       _maxLength = maxLength,
       _label = label,
       _icon = icon,
       _validator = validator,
       _keyboardType = keyboardType,
       _formatters = formatters,
       _obscureTextVN = ValueNotifier<bool>(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureTextVN,
      builder: (context, obscureTextVNValue, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.green,
              ),
            ),
            TextFormField(
              onEditingComplete: onEditingComplete,
              inputFormatters: _formatters,
              focusNode: focusNode,
              maxLength: _maxLength,
              obscureText: obscureTextVNValue,
              keyboardType: _keyboardType,
              validator: _validator,
              controller: _controller,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w400,
                color: AppColors.regularFontColor,
              ),

              decoration: InputDecoration(
                counterText: "",
                hintText: _label, // The placeholder text
                hintStyle: TextStyle(
                  fontSize: 16,

                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  color: AppColors.placeholderColor, // Custom font style
                  // Add other TextStyle properties as needed
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 20,
                  maxHeight: 40,
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 40),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.lightGray,
                  ), // Set your desired color here
                ),
                // Border when the TextField is focused
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.green,
                    width: 2,
                  ), // Set your desired color here
                ),
                // Border when there's an error
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                  ), // Set your desired color here
                ),
                // Border when focused and there's an error
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                  ), // Set your desired color here
                ),

                prefixIcon: _icon,
                suffixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          _obscureTextVN.value = !obscureTextVNValue;
                        },
                        icon: obscureTextVNValue
                            ? Icon(
                                AppIcons.eye,
                                color: AppColors.green,
                                size: 16,
                              )
                            : Icon(
                                AppIcons.eye_slash,
                                color: AppColors.green,
                                size: 16,
                              ),
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
