import 'package:get/get.dart';

import '../../presentation/pages/dashboard/dashboard.dart';

class DashboardBinding implements Bindings {
  void dependencies() => Get.lazyPut(() => DashboardController());
}
