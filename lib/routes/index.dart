import 'package:flutter/material.dart';
import 'package:jx3_app/pages/calendar/index.dart';
import 'package:jx3_app/pages/home/index.dart';

Widget getRouteWidget() {
  return MaterialApp(
    routes: {},
    initialRoute: '/',
  );
}

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    '/': (context) => HomePage(),
    '/calendar': (context) => CalendarPage(),
  };
}
