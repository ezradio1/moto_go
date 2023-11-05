import 'package:flutter/material.dart';
import 'package:moto_go/constants/fonts.dart';
import 'package:moto_go/models/motorcycle.dart';
import 'package:moto_go/utils/format_price.dart';
import 'package:moto_go/widget/button_custom.dart';

class DialogRentSuccess extends StatelessWidget {
  const DialogRentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      title: const Text(
        'Rental Success',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
          'Thank you for using MotoGo. We hope you have a pleasant journey!'),
      actions: [
        ButtonCustom(
            text: 'Ok',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            })
      ],
    );
  }
}
