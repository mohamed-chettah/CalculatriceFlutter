import 'package:flutter/material.dart';

ButtonStyle buttonStyle(String button) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    backgroundColor: _getButtonColor(button),
    padding: EdgeInsets.all(20),
  );
}

Color _getButtonColor(String button) {
  if (button == 'C') return Colors.redAccent;
  if (button == '=' || button == '%') return Colors.green;
  if (button == '⌫') return Colors.orange;
  if ('+-*/'.contains(button)) return Colors.blueGrey;
  return Colors.grey[700]!;
}
