import 'package:flutter/material.dart';
import 'package:wolkk_job/router/router.dart';

void main() {
  runApp(
    MaterialApp.router(
      title: 'Wolkk Job!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: routers,
    ),
  );
}
