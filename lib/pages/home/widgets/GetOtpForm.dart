import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetOtpForm extends StatelessWidget {
  const GetOtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 15,
          ),
          child: Stack(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                cursorColor: const Color(0xFF5F67EA),
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF6F8FF),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                      top: 15, left: 50, right: 20, bottom: 20),
                  prefix: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("+261"),
                  ),
                  hintText: "Enter your phone number",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF5F67EA),
                  ),
                  child: const Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              )
            ],
          ),
        ),
        FilledButton(
          onPressed: () async {
            FirebaseAuth auth = FirebaseAuth.instance;
            await auth.verifyPhoneNumber(
              phoneNumber: '+261384882135',
              verificationCompleted: (PhoneAuthCredential credential) async {
                await auth.signInWithCredential(credential);
              },
              verificationFailed: (FirebaseAuthException e) {
                if (e.code == 'invalid-phone-number') {
                  print('The provided phone number is not valid.');
                }
              },
              codeSent: (String verificationId, int? resendToken) {},
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          },
          style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Get OTP",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward_outlined, color: Colors.white)
            ],
          ),
        )
      ],
    );
  }
}
