import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideaspark/getStarted.dart';
import 'register.dart';
import 'fetch_ip.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IdeaSpark',
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
    );
  }
}

