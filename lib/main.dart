import "package:flutter/material.dart";
import "package:fluter_agenda/pages/home/home.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ScheduLife",
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
