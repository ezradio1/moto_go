import 'package:flutter/material.dart';
import 'package:moto_go/utils/screen.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double maxWidthScreen = getMaxWidth(context);

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidthScreen),
      child: child,
    );
  }
}
