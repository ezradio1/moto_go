import 'package:flutter/material.dart';
import 'package:moto_go/constants/app_config.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/constants/fonts.dart';
import 'package:moto_go/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
        fontFamily: FontConstants.primary,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primary),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
