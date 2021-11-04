import 'package:flutter/material.dart';
import 'package:flutter_passwordless_auth/my_home_page.dart';
import 'package:magic_sdk/magic_sdk.dart';

void main() {
  runApp(const MyApp());
  Magic.instance = Magic("pk_live_A60A6907FD3E31B3");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Stack(
          children: [const MyHomePage(), Magic.instance.relayer],
        ));
  }
}
