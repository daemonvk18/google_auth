import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //intializing the current user
  final user = FirebaseAuth.instance.currentUser!;

  //log out method
  void Signout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: Signout, icon: Icon(Icons.logout))],
      ),
      body: Center(child: Text("LOGGED IN as ${user.email}")),
    );
  }
}
