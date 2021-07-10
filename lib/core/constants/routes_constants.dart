import 'package:get_storage/get_storage.dart';

class RoutesConsts {
  static Future<String> get initialRoute async {
    if (GetStorage().hasData('token')) {
      return dashboard;
    }
    return login;
  }

  static const String dashboard = "/dashboard";
  static const String login = "/login";
  static const String reports = "/reports";
}
