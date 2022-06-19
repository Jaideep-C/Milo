import 'package:flutter/material.dart';

import '../utils/screen_decoration.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: screenDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login As?"),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _textButton(
                    context: context,
                    onPressed: () {
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => const DriverApp()))
                    },
                    data: "Driver",
                  ),
                  const SizedBox(width: 5),
                  _textButton(
                    context: context,
                    onPressed: () {
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => const PatientApp()))
                    },
                    data: "Patient",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textButton(
      {required BuildContext context,
      required VoidCallback onPressed,
      String? data}) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black)),
        child: Text(data ?? ""),
      ),
    );
  }
}
