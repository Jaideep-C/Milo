import 'package:flutter/material.dart';

import '../services/authentication.dart';
import '../utils/bezier_screen_ui.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailIdController;
  late TextEditingController passwordController;
  String? err;
  @override
  void initState() {
    super.initState();
    emailIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget child(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome Back!",
            style: TextStyle(fontSize: 50),
          ),
          const SizedBox(height: 10),
          entryField(
              fieldName: "EmailId", textEditingController: emailIdController),
          const SizedBox(height: 10),
          entryField(
            fieldName: "password",
            textEditingController: passwordController,
            obscureTextFieldValue: true,
          ),
          const Text(
            "Forgot password?",
            style: TextStyle(color: Colors.blueAccent),
          ),
          Visibility(
            visible: err != null,
            child: Text(
              err ?? "",
              style: const TextStyle(color: Colors.red),
            ),
          ),
          flatTextButton(
            onTap: () {
              try {
                AuthenticationService().signIn(
                  email: emailIdController.text,
                  password: passwordController.text,
                );
                setState(() {
                  err = null;
                });
              } catch (e) {
                setState(() {
                  err = e.toString();
                });
              }
              if (err == null) {
                Navigator.pop(context);
              }
            },
            data: "Submit",
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BezierScreenUI(
      child: child(context),
      onClickingBack: () => Navigator.pop(context),
    );
  }
}
