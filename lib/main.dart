import 'package:flutter/material.dart';
import 'package:wolkk_job/pages/landing_page.dart';
import 'package:wolkk_job/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wolkk Job',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: routers,
    );
  }
}
