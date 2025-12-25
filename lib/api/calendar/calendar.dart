import 'package:jx3_app/api/calendar/model.dart';
import 'package:jx3_app/api/dio_utils.dart';

Future<CalendarItem> getTodayCalendarApi(String server) async {
  return CalendarItem.fromJson((await DioUtils.getInstance()
          .get("/calendar", queryParameters: {"server": server})
      as Map<String, dynamic>)['json_data'] as Map<String, dynamic>);
}
