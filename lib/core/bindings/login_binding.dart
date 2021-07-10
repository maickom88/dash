import 'package:dash/presentation/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  void dependencies() => Get.lazyPut(() => LoginController());
}
