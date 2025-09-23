import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/ui/core/ui/loader.dart';
import 'package:flutter_template/ui/core/ui/pulse_filled_button.dart';
import 'package:flutter_template/ui/core/ui/pulse_text_button.dart';
import 'package:flutter_template/ui/core/ui/pulse_text_form_field.dart';
import 'package:flutter_template/ui/login/view_model/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
      body: Selector<LoginViewModel, bool>(
        selector: (_, viewModel) => viewModel.isLoading,
        builder: (_, isLoading, child) {
          return Stack(
            children: [
              Padding(
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
                          PulseTextFormField(
                            maxLength: 14,
                            formatters: [maskFormatter],
                            controller: _cpfEC,
                            onEditingComplete: () {
                              _secondFieldFocusNode.requestFocus();
                            },
                            focusNode: _firstFieldFocusNode,
                            keyboardType: TextInputType.number,
                            label: "Digite seu CPF",
                            icon: SvgPicture.asset(
                              "assets/images/person.svg",
                              height: 20,
                              width: 20,

                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                            ),
                            obscureText: false,
                            validator: Validatorless.multiple([
                              Validatorless.required("CPF obrigatório"),
                              Validatorless.cpf("CPF em formato incorreto"),
                            ]),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          PulseTextFormField(
                            maxLength: 20,
                            controller: _passwordEC,
                            formatters: [],
                            focusNode: _secondFieldFocusNode,
                            keyboardType: TextInputType.text,
                            label: "Digite sua senha",
                            icon: SvgPicture.asset(
                              "assets/images/lock.svg",
                              height: 20,
                              width: 20,

                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                            ),
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
                            child: PulseFilledButton(
                              onPressed: () async {
                                final formValid =
                                    _formKey.currentState?.validate() ?? false;
                                if (formValid) {
                                  final cpf = maskFormatter.getUnmaskedText();
                                  final password = _passwordEC.text;
                                  await _loginViewModel.login(cpf, password);
                                  await Navigator.of(
                                    context,
                                  ).pushNamed("terms-of-service");
                                }
                              },
                              text: "Acessar",
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: PulseTextButton(
                              onPressed: () {
                                Navigator.of(
                                  context,
                                ).pushNamed("/forgotpassword");
                              },
                              text: "Esqueci minha senha",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                PopScope(
                  onPopInvokedWithResult: (didPop, result) {},
                  canPop: false,
                  child: Loader(),
                ),
            ],
          );
        },
      ),
    );
  }
}
