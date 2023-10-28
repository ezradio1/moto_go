import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';

enum ButtonType { primary, outline }

class ButtonCustom extends StatelessWidget {
  final String text;
  final ButtonType type;
  final Function onPressed;
  const ButtonCustom(
      {super.key,
      required this.text,
      this.type = ButtonType.primary,
      required this.onPressed});

  TextStyle getTextStyle() {
    switch (type) {
      case ButtonType.primary:
        return const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold);
      case ButtonType.outline:
        return TextStyle(
            color: ColorConstants.primary, fontWeight: FontWeight.bold);
    }
  }

  Map<String, dynamic> getButtonStyle() {
    switch (type) {
      case ButtonType.primary:
        return {
          'side': BorderSide(color: ColorConstants.primary, width: 0),
          'backgroundColor': ColorConstants.primary,
        };
      case ButtonType.outline:
        return {
          'side': BorderSide(color: ColorConstants.primary, width: 1),
          'backgroundColor': Colors.white,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        side: getButtonStyle()['side'],
        elevation: 0,
        backgroundColor: getButtonStyle()['backgroundColor'],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: Text(
        text,
        style: getTextStyle(),
      ),
    );
  }
}
