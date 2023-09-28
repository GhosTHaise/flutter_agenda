import "package:flutter/material.dart";
import "package:fluter_agenda/pages/home/widgets/GetOtpForm.dart";

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
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        height: 380,
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
          child: Container(
            padding: const EdgeInsets.all(25),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            onPressed: () => {},
                            child: Image.asset(
                              "assets/images/google.png",
                              height: 55,
                              width: 30,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("- or -"),
                    const GetOtpForm(),
                    const SizedBox(height: 25),
                    const Text.rich(
                      TextSpan(
                        text: 'By continuing, I hereby accept the',
                        // default text
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFF616C74)),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Terms of Service  ',
                              style: TextStyle(color: Color(0xFF0088EE))),
                          TextSpan(text: 'and ', style: TextStyle()),
                          TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(color: Color(0xFF0088EE)))
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
