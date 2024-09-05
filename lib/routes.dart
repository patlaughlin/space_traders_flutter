import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_traders/features/dashboard/screens/dashboard_screen.dart';
import 'package:space_traders/features/fleet/screens/fleet_screen.dart';
import 'package:space_traders/main_layout.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => DashboardScreen(),
        ),
        GoRoute(
          path: '/fleet',
          builder: (context, state) => FleetScreen(),
        ),
      ],
    ),
  ],
);
