import 'package:flutter/material.dart';

BoxDecoration screenDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      colors: [
        Color(0xff3a7bd5),
        Color(0xff00d2ff),
      ],
    ),
  );
}
