import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;

  return screenSize.width <= 768;
}

double getMaxWidth(BuildContext context) {
  return !isMobile(context) ? 1200.0 : double.infinity;
}
