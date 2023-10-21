import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primary),
          useMaterial3: true,
          fontFamily: 'Poppins'),
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
