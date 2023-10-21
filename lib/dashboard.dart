import 'package:flutter/material.dart';
import 'package:moto_go/constants/app_config.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/constants/fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primary),
          useMaterial3: true,
          fontFamily: FontConstants.primary),
      home: Scaffold(
        body: Container(
            color: Colors.white,
            child: const Center(
              child: Text('Dashboard'),
            )),
      ),
    );
  }
}
