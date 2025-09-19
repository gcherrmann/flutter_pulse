import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/core/ui/pulse_filled_button.dart';
import 'package:flutter_template/ui/core/ui/pulse_text_form_field.dart';
import 'package:flutter_template/ui/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ForgotPasswordViewModel _forgotPasswordViewModel;
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _forgotPasswordViewModel = context.read<ForgotPasswordViewModel>();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset("assets/images/arrow_back.svg"),
          iconSize: 20,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Esqueci minha senha",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  color: AppColors.boldFontColor,
                ),
              ),
              SizedBox(height: 32),
              Form(
                key: _formKey,
                child: PulseTextFormField(
                  maxLength: 20,
                  controller: _emailEC,
                  formatters: [],
                  keyboardType: TextInputType.emailAddress,

                  label: "Digite o e-mail cadastrado",
                  icon: SvgPicture.asset(
                    "assets/images/email.svg",
                    height: 20,
                    width: 20,

                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                  ),
                  obscureText: false,
                  validator: Validatorless.multiple([
                    Validatorless.required("Email obrigatório"),
                    Validatorless.email(
                      "E-mail em formato incorreto",
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: PulseFilledButton(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      final email = _emailEC.text;
                      await _forgotPasswordViewModel.sendRecoveryEmail(email);
                    }
                  },
                  text: "Enviar Link de Recuperação",
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
