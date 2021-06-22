import 'package:get/route_manager.dart';

import '../../presentation/pages/dashboard/dashboard.dart';
import '../../presentation/pages/login/login.dart';
import '../../presentation/pages/reports/reports_page.dart';
import '../bindings/bindings.dart';
import '../constants/constants.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: RoutesConsts.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConsts.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RoutesConsts.reports,
      page: () => ReportsPage(),
      binding: ReportsBinding(),
    ),
  ];
}
