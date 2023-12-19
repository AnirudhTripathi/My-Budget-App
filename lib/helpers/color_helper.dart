import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.70) {
    return Colors.redAccent;
  } else if (percent >= 0.4) {
    return Colors.orangeAccent;
  } else
    return Colors.lightGreen.shade800;
}
