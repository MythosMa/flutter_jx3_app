import 'package:flutter/material.dart';
import 'package:jx3_app/api/calendar/calendar.dart';
import 'package:jx3_app/components/customCard/card.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Map<String, dynamic> currentServer = {};
  Map<String, dynamic> todayCalendar = {};

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      final route = ModalRoute.of(context);
      if (route?.settings.arguments != null) {
        print(route?.settings.arguments);
        Map<String, dynamic> arguments =
            route!.settings.arguments as Map<String, dynamic>;
        if (arguments['server'] != null) {
          currentServer = arguments['server'];
          getTodayCalendarApi(currentServer['server_name']).then((value) {
            todayCalendar = value;
            setState(() {});
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("今日活动"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                if (todayCalendar.isNotEmpty) ...[
                  CustomInfoCard(
                    content: Text(
                      "大战：${todayCalendar['json_data']['war']}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  CustomInfoCard(
                    content: Text(
                      "宠物福缘：${todayCalendar['json_data']['luck'].join(',')}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ));
  }
}
