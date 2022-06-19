import 'package:flutter/material.dart';
import 'package:milo/services/authentication.dart';

import '../utils/bezier_screen_ui.dart';
import '../utils/utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController emailIdController;
  late TextEditingController passwordController;
  bool isDriver = false;
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
            "Create a new account",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isDriver,
                onChanged: (updatedIsDriver) {
                  setState(() {
                    isDriver = updatedIsDriver!;
                  });
                },
              ),
              const Text(
                "Are you an ambulance 🚨 driver?",
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
          Visibility(
            visible: err != null,
            child: Text(
              err ?? "",
              style: const TextStyle(color: Colors.red),
            ),
          ),
          flatTextButton(
            onTap: () async {
              try {
                await AuthenticationService().signUp(
                  email: emailIdController.text,
                  password: passwordController.text,
                  isDriver: isDriver,
                );
                setState(() => err = null);
              } catch (e) {
                setState(() => err = e.toString());
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
