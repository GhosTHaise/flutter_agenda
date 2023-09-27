import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetOtpForm extends StatelessWidget {
  const GetOtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 25,
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
    );
  }
}
