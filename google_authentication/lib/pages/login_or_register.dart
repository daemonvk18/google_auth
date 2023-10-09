import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_authentication/pages/loginpage.dart';
import 'package:google_authentication/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initailly show the login page
  bool showloginpage = true;

  //method to toggle between loginpage and registerpage
  void togglemethod() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage(onTap: togglemethod);
    } else {
      return RegisterPage(
        onTap: togglemethod,
      );
    }
  }
}
