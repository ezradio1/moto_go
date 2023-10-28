import 'package:flutter/material.dart';

enum SizeOption { medium, large }

class StatusChip extends StatelessWidget {
  final bool isAvailable;
  final SizeOption? size;
  const StatusChip(
      {super.key, required this.isAvailable, this.size = SizeOption.medium});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(size == SizeOption.large ? 8 : 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isAvailable ? Colors.green : Colors.red,
        ),
        child: Text(
          isAvailable ? 'Available' : 'Full Booked',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size == SizeOption.large ? 16 : 10,
            color: Colors.white,
          ),
        ));
  }
}
