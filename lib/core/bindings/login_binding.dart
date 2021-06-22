import 'package:get/get.dart';

import '../../presentation/pages/login/login.dart';

class LoginBinding implements Bindings {
  void dependencies() => Get.lazyPut(() => LoginController());
}
