import 'package:flutter/material.dart';
import 'package:jx3_app/routes/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "剑网三小助手 ",
      routes: getRoutes(),
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Color(0xFFF5F3EB),

          //appbar
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFECE8E0),
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Color(0xFFC9A24D),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          )),
    );
  }
}
