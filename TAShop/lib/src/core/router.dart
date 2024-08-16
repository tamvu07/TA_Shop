
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ta_shop/src/screens/add_users_page.dart';
import 'package:ta_shop/src/screens/home_page.dart';
import 'package:ta_shop/src/screens/sms.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/addUsers',
      builder: (BuildContext context, GoRouterState state) => const AddUsersPage(),
    ),
    GoRoute(
      path: '/sms',
      builder: (BuildContext context, GoRouterState state) => const SMSPage(),
    ),
  ],
);