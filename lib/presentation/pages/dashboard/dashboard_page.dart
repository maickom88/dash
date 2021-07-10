import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../../core/extensions/extensions.dart';
import 'dashboard.dart';
import 'widgets/widgets.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: DrawerWidget(),
        ),
        body: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(Layout.defaultPadding),
                width: double.infinity,
                height: Get.height,
                color: Color(0xFF212332),
                child: ListView(
                  children: [
                    HeaderPanelWidget(
                      scaffoldKey: _scaffoldKey,
                      email: controller.tokenModel?.username ?? '',
                      onTap: () async {
                        await controller.logout();
                        Get.offAllNamed(RoutesConsts.login);
                      },
                    ),
                    withSpaceHeight(),
                    Column(
                      children: [
                        // Responsive(
                        //   mobile: InfoCardGridView(
                        //     list: list,
                        //     childAspectRatio: 1.2,
                        //     crossAxisCount: 2,
                        //     sizeText: 30,
                        //     heightText: 1,
                        //   ),
                        //   desktop: InfoCardGridView(
                        //     list: list,
                        //     childAspectRatio: 1.2,
                        //     heightText: 1.1,
                        //   ),
                        //   tablet: InfoCardGridView(
                        //     list: list,
                        //   ),
                        // ),
                        withSpaceHeight(size: Get.height.percent(10)),
                        withSpaceHeight(size: 10),
                        Container(
                          padding: EdgeInsets.all(Layout.defaultPadding),
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Layout.defaultBorderRadius),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderTableWidget(
                                title: 'PGE',
                                onSearch: (value) =>
                                    controller.searchCompany(value),
                              ),
                              Obx(
                                () => SizedBox(
                                  width: Get.width,
                                  child: TableWidget(
                                    columns: [
                                      'NOME',
                                      'CNPJ',
                                      'PEP',
                                      'ORDINARY',
                                      'TOTAL_AUT',
                                      'TOTAL_DEC',
                                      'COUNTRY',
                                      'INDUSTRY',
                                    ],
                                    rows: controller
                                            .companyModelSearchRx.value.isEmpty
                                        ? controller.companies.value
                                        : controller.companyModelSearchRx.value,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    withSpaceHeight(size: 45),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
