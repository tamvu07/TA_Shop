
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ta_shop/src/screens/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: <GoRoute>[
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    // GoRoute(
    //   path: '/details/:id',
    //   builder: (BuildContext context, GoRouterState state) => DetailsPage(
    //     id: state.params['id']!,
    //   ),
    // ),
  ],
);