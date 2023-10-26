import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:fluter_agenda/pages/Login/logic/google_sign_in.dart";
import "package:fluter_agenda/pages/Login/login.dart";
import "package:fluter_agenda/pages/home/home.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";
import 'package:calendar_view/calendar_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: CalendarControllerProvider(
            controller: EventController(),
            child: MaterialApp(
                title: "ScheduLife",
                debugShowCheckedModeBanner: false,
                home: Scaffold(body: homePage()))));
  }
}
