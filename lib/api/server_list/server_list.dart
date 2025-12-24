import 'package:jx3_app/api/dio_utils.dart';

Future<List<Map<String, dynamic>>> getServerListApi() async {
  List result = await DioUtils.getInstance().get("server-list") as List;
  return result.cast<Map<String, dynamic>>();
}
