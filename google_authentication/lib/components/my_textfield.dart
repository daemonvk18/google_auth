import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final textcontroller;
  final String hinttext;
  final bool obscuretext;
  MyTextField(
      {required this.textcontroller,
      required this.hinttext,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: TextField(
        controller: textcontroller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            hintText: hinttext,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
