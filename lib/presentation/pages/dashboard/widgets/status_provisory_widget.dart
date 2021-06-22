import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/utils/responsive_util.dart';

class StatusProvisoryWidget extends StatelessWidget {
  const StatusProvisoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(bottom: 220),
      padding: EdgeInsets.all(Layout.defaultPadding),
      constraints: BoxConstraints(maxHeight: Get.height.percent(77)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Layout.defaultBorderRadius),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Scrollbar(
        child: ListView(
          children: [
            AutoSizeText(
              "STATUS DOS SUPERVISÓRIOS",
              maxFontSize: 100,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: Responsive.isMobile(context) ? 23 : 100,
                  color: Colors.white),
            ),
            SizedBox(
              width: Get.width,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: 20,
                columns: [
                  DataColumn(
                      label: Text(
                    "Local",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(height: 0.3, fontSize: 13),
                  )),
                  DataColumn(
                    label: Text(
                      "Status",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(height: 0.3, fontSize: 13),
                    ),
                  )
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Pronto Socorro",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Responsive.isMobile(context)
                                  ? Get.width.percent(5)
                                  : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Responsive.isMobile(context)
                                  ? Get.width.percent(5)
                                  : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "HBDF - Internação",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Container(
                          width: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          height: Responsive.isMobile(context)
                              ? Get.width.percent(5)
                              : Get.width.percent(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
