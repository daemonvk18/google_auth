import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_authentication/components/my_textfield.dart';
import 'package:google_authentication/components/neomorph_containers.dart';
import 'package:google_authentication/pages/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  late final Function()? onTap;
  LoginPage({required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //textediting controllers
  final controller1 = TextEditingController();

  final controller2 = TextEditingController();

  //sig in user method
  void signuserIn() async {
    //show loading circle unitl we login
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    //try siginig in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: controller1.text, password: controller2.text);

      //pop out the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop out the loading circle
      Navigator.pop(context);
      //show error message
      ErrorMessage(e.code);
    }
  }

  //wrong email message popup
  void ErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                //first a small logo kind a image
                Icon(
                  Icons.lock,
                  size: 120.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),

                //welcome back you have been missed text
                Text("Welcome Back You Have Been Missed!",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 30.0,
                ),
                //textfiledemail
                MyTextField(
                  textcontroller: controller1,
                  hinttext: "Username",
                  obscuretext: false,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                //trextfieldpassword
                MyTextField(
                  textcontroller: controller2,
                  hinttext: "password",
                  obscuretext: true,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                //forgotpassword
                Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(
                          color: Colors.grey[600],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                //sigin button
                GestureDetector(
                  onTap: signuserIn,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        " Or Continue With ",
                        style: GoogleFonts.nunito(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                //google+apple button
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DepthContainers(
                          imagestring: "lib/images/google.png",
                          ontap: () => AuthService().signInWithGoogle()),
                      DepthContainers(
                          imagestring: "lib/images/apple.png", ontap: () {})
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                //if not a member then option to register
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a Member? ",
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Register Here",
                          style: GoogleFonts.poppins(
                              color: Colors.deepPurple,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
