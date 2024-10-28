import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wolkk_job/pages/landing_page.dart';

final GoRouter routers = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(title: 'Wolkk Job'),
    ),
    GoRoute(
      path: '/careers',
      builder: (context, state) => const Center(
        child: Text('Careers'),
      ),
    ),
  ],
);
