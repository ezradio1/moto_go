import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';

enum ButtonType { primary, outline, danger }

class ButtonCustom extends StatefulWidget {
  final String text;
  final ButtonType type;
  final Function onPressed;
  final bool loading;
  const ButtonCustom(
      {super.key,
      this.loading = false,
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
      case ButtonType.danger:
        return const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold);
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
    }
  }
  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.loading ? () {} : widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          side: widget.getButtonStyle()['side'],
          elevation: 0,
          backgroundColor: widget.getButtonStyle()['backgroundColor'],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        child: Stack(
          children: [
            Visibility(
              visible: !widget.loading,
              child: Text(
                widget.text,
                style: widget.getTextStyle(),
              ),
            ),
            Visibility(
                visible: widget.loading,
                child: const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ))
          ],
        ));
  }
}
