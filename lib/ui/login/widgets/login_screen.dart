import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/ui/core/themes/app_colors.dart';
import 'package:flutter_template/ui/login/view_model/login_view_model.dart';
import 'package:flutter_template/ui/login/widgets/login_text_form_field.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginViewModel _loginViewModel;
  final _formKey = GlobalKey<FormState>();
  final _cpfEC = TextEditingController();
  final _passwordEC = TextEditingController();
  late FocusNode _firstFieldFocusNode;
  late FocusNode _secondFieldFocusNode;

  var maskFormatter = new MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    super.initState();
    _loginViewModel = context.read<LoginViewModel>();
    _firstFieldFocusNode = FocusNode();
    _secondFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstFieldFocusNode.dispose();
    _secondFieldFocusNode.dispose();
    _cpfEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/logo.svg"),
            SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginTextFormField(
                    maxLength: 14,
                    formatters: [maskFormatter],
                    controller: _cpfEC,
                    onEditingComplete: () {
                      _secondFieldFocusNode.requestFocus();
                    },
                    focusNode: _firstFieldFocusNode,
                    isPassword: false,
                    keyboardType: TextInputType.number,
                    label: "Digite seu CPF",
                    obscureText: false,
                    validator: Validatorless.multiple([
                      Validatorless.required("CPF obrigatório"),
                      Validatorless.cpf("CPF em formato incorreto"),
                    ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  LoginTextFormField(
                    maxLength: 20,
                    controller: _passwordEC,
                    formatters: [],
                    focusNode: _secondFieldFocusNode,
                    isPassword: true,
                    keyboardType: TextInputType.text,
                    label: "Digite sua senha",
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required("Senha obrigatória"),
                      Validatorless.min(
                        6,
                        "A senha deve conter pelo menos 6 dígitos",
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.green,
                      ),
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          final cpf = maskFormatter.getUnmaskedText();
                          final password = _passwordEC.text;
                          _loginViewModel.login(cpf, password);
                        }
                      },
                      child: Text(
                        "Acessar",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.read<LoginViewModel>().hideLoader();
                      },
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
