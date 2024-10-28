// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wolkk_job/pages/career_pages.dart';
import 'package:wolkk_job/pages/careers_details_page.dart';
import 'package:wolkk_job/pages/form_page.dart';
import 'package:wolkk_job/pages/landing_page.dart';

final GoRouter routers = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const LandingPage(title: 'Wolkk Job!'),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/careers',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const CareerPages(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      builder: (context, state) => const CareerDetailsPage(title: 'Career'),
    ),
    GoRoute(
      path: '/apply',
      builder: (context, state) => const FormPage(),
    ),
  ],
);
