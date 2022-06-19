import 'package:flutter/material.dart';

import 'bezier_container.dart';

class BezierScreenUI extends StatelessWidget {
  const BezierScreenUI({
    Key? key,
    required this.child,
    this.onClickingBack,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onClickingBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: -MediaQuery.of(context).size.height * .2,
                right: -MediaQuery.of(context).size.width * 0.1,
                child: const BezierContainer(),
              ),
              Positioned(
                top: -MediaQuery.of(context).size.height * .25,
                right: -MediaQuery.of(context).size.width * .3,
                child: const BezierContainer(blue: true),
              ),
              child,
              Visibility(
                visible: onClickingBack != null,
                child: Positioned(
                  top: 40,
                  left: 0,
                  child: _backButton(
                    onClickingBack: onClickingBack,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton({required VoidCallback? onClickingBack}) {
    return InkWell(
      onTap: onClickingBack,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            const Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
