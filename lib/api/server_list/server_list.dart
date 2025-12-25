import 'package:jx3_app/api/dio_utils.dart';
import 'package:jx3_app/api/server_list/model.dart';

Future<List<ServerItem>> getServerListApi() async {
  return (await DioUtils.getInstance().get("server-list") as List)
      .map((item) => ServerItem.fromJson(item as Map<String, dynamic>))
      .toList();
}
