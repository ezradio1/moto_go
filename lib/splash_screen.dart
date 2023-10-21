import 'package:flutter/material.dart';
import 'package:moto_go/constants/app_config.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/constants/fonts.dart';
import 'package:moto_go/dashboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Dashboard()), // Navigate to main screen
      );
    });

    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primary),
          useMaterial3: true,
          fontFamily: FontConstants.primary),
      home: Scaffold(
        body: Container(
          color: ColorConstants.primary,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo_white.png',
                width: 240,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Ride On, Ride Strong',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
