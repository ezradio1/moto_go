import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';

enum ButtonType { primary, outline, danger, light }

class ButtonCustom extends StatelessWidget {
  final String text;
  final ButtonType type;
  final Function onPressed;
  final bool loading;
  final IconData? icon;
  const ButtonCustom(
      {super.key,
      this.loading = false,
      required this.text,
      this.type = ButtonType.primary,
      this.icon,
      required this.onPressed});

  TextStyle getTextStyle() {
    switch (type) {
      case ButtonType.primary:
        return const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold);
      case ButtonType.outline:
        return TextStyle(
            color: ColorConstants.primary, fontWeight: FontWeight.bold);
      case ButtonType.danger:
        return const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold);
      case ButtonType.light:
        return const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold);
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
      case ButtonType.danger:
        return {
          'side': const BorderSide(color: Colors.red, width: 1),
          'backgroundColor': Colors.red,
        };
      case ButtonType.light:
        return {
          'side': const BorderSide(color: Colors.black, width: 1),
          'backgroundColor': Colors.transparent,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          loading ? () {} : onPressed();
        },
        style: ElevatedButton.styleFrom(
          side: getButtonStyle()['side'],
          elevation: 0,
          backgroundColor: getButtonStyle()['backgroundColor'],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        child: Stack(
          children: [
            Visibility(
              visible: !loading,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  Text(
                    text,
                    style: getTextStyle(),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: loading,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color:
                        type == ButtonType.light ? Colors.black : Colors.white,
                    strokeWidth: 2,
                  ),
                ))
          ],
        ));
  }
}
