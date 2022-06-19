import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_clipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key, this.blue = false}) : super(key: key);
  final bool blue;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 7.1,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              // end: Alignment.bottomRight,
              colors: (blue)
                  ? (const [Color(0xff3a7bd5), Color(0xff00d2ff)])
                  : (const [Color(0xfffbb448), Color(0xffe46b10)]),
            ),
          ),
        ),
      ),
    );
  }
}
