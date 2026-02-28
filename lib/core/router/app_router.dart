import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_contato/features/home/home.dart';
import 'package:lista_contato/features/new_contact/new_contact.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final routers = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Home.route,
  routes: [
    GoRoute(
      path: Home.route,
      name: Home.route,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: NewContact.route,
      name: NewContact.route,
      builder: (context, state) => const NewContact(),
    ),
  ],
);
