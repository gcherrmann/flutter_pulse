import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/routing/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/data/services/api/api_service.dart';
import 'package:flutter_template/data/services/api/api_service_impl.dart';
import 'package:flutter_template/ui/login/view_model/login_view_model.dart';
import 'package:flutter_template/ui/login/widgets/login_screen.dart';
import 'package:flutter_template/utils/preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences().init();

  HttpOverrides.global = MyHttpOverrides();
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiServiceImpl(),
          lazy: false,
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Esfera Pulse',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          ),
          //home: defaultHome,
          initialRoute: "/dashboard",

          routes: appRoutes,
        );
      },
    );
  }
}
