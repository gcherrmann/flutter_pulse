import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/ui/core/icons/app_icons.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';

class LoginTextFormField extends StatelessWidget {
  final TextEditingController _controller;
  final FocusNode _focusNode;
  final int _maxLength;
  final bool obscureText;
  final String _label;
  final List<TextInputFormatter> _formatters;
  final String? Function(String?)? _validator;
  final TextInputType _keyboardType;
  final ValueNotifier<bool> _obscureTextVN;
  final VoidCallback? onEditingComplete;

  LoginTextFormField({
    super.key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required int maxLength,
    required bool isPassword,
    this.obscureText = false,
    this.onEditingComplete,
    required List<TextInputFormatter> formatters,
    required String label,
    String? Function(String?)? validator,
    required TextInputType keyboardType,
  }) : _controller = controller,
       _focusNode = focusNode,
       _maxLength = maxLength,
       _label = label,
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
              focusNode: _focusNode,
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
                prefixIconConstraints: BoxConstraints(maxWidth: 40),
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

                prefixIcon: SvgPicture.asset(
                  "assets/images/person.svg",
                  height: 20,
                  width: 20,

                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                ),
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
