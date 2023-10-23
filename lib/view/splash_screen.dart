import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/layout/layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Layout()), // Navigate to main screen
      );
    });

    return Scaffold(
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
    );
  }
}
