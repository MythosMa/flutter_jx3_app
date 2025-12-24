import 'package:jx3_app/api/dio_utils.dart';

Future<Map<String, dynamic>> getTodayCalendarApi(String server) async {
  Map<String, dynamic> result = await DioUtils.getInstance().get("calendar",
      queryParameters: {"server": server}) as Map<String, dynamic>;
  return result;
}
