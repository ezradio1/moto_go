import 'package:flutter/material.dart';
import 'package:moto_go/widget/button_custom.dart';

class DialogComingSoon extends StatelessWidget {
  const DialogComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 280,
          height: 320,
          child: Column(
            children: [
              const Text(
                'Exciting New Feature Coming Soon',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Image.asset(
                'images/coming_soon_illustration.png',
                width: 400,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Stay tuned for an amazing addition to our app! We're working hard to bring you something special. Keep an eye out!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: ButtonCustom(
              text: 'Ok',
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ],
    );
  }
}
