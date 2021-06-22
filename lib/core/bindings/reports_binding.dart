import 'package:get/get.dart';

import '../../presentation/pages/reports/reports.dart';

class ReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsController());
  }
}
