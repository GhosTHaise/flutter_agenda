import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0088EE),
      body: const Text("Je commence"),
      bottomNavigationBar: Container(
          //color: Colors.white,
          height: (MediaQuery.of(context).size.height * 0.5),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10),
          ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                color: Colors.white,
                child: Stack(
                  children: const [
                    Text(
                      "Get Started",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
    ;
  }
}
