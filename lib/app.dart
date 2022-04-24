import "package:flutter/material.dart";
import 'package:login_stateful/src/screen/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "log me  app",
      home: SafeArea(
        child: Scaffold(body: LoginScreen()),
      ),
    );
  }
}
