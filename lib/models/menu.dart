import 'package:flutter/material.dart';

class Menu {
  IconData icon;
  String title;
  Function onClick;

  Menu(this.icon, this.title, this.onClick);
}
