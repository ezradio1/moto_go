import 'package:flutter/material.dart';

class InputCustom extends StatefulWidget {
  final String labelText;
  final IconData? icon;
  final bool obscureText;
  final String? errorText;
  final Function(String)? onChanged;
  const InputCustom(
      {required this.labelText,
      this.icon,
      this.onChanged,
      this.obscureText = false,
      this.errorText,
      super.key});

  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText == false ? false : isVisible,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          errorText: widget.errorText,
          contentPadding: const EdgeInsets.all(12),
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          labelText: widget.labelText,
          border: const OutlineInputBorder(),
          suffixIcon: widget.obscureText == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon:
                      Icon(isVisible ? Icons.visibility_off : Icons.visibility))
              : null),
    );
  }
}
