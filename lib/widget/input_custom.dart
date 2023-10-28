import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  final String labelText;
  final IconData? icon;
  final Function(String)? onChanged;
  const InputCustom(
      {required this.labelText, this.icon, this.onChanged, super.key});

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
