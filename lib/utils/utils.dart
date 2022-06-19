import 'package:flutter/material.dart';

enum AppUser { driver, patient }

Widget flatTextButton(
    {required String data,
    required double? width,
    required VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 3)
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff3a7bd5), Color(0xff00d2ff)])),
      child: Text(
        data,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}

Widget entryField(
    {required TextEditingController textEditingController,
    String hint = "",
    required String fieldName,
    bool obscureTextFieldValue = false}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(width: 10),
        TextField(
          controller: textEditingController,
          obscureText: obscureTextFieldValue,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            fillColor: const Color(0xfff3f3f4),
            filled: true,
          ),
        ),
      ],
    ),
  );
}
