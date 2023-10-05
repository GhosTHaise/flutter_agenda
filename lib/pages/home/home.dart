import "package:firebase_auth/firebase_auth.dart";
import "package:fluter_agenda/pages/Login/login.dart";
import "package:flutter/material.dart";

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0088EE),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const Center(
                child: Text("I am home baby !"),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
