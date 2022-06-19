import 'package:flutter/material.dart';
import 'package:milo/screens/login_screen.dart';
import 'package:milo/screens/registration_screen.dart';

import '../utils/bezier_screen_ui.dart';
import '../utils/utils.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key, this.loginAsDriver = false}) : super(key: key);
  final bool loginAsDriver;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var child = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome to Milo",
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 5, width: MediaQuery.of(context).size.width),
          flatTextButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            data: "Login to an existing account",
            width: MediaQuery.of(context).size.width,
          ),
          flatTextButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()));
            },
            data: "Create a new account",
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
    return BezierScreenUI(child: child);
  }
}
