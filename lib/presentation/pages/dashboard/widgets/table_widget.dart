import 'package:dash/core/utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/extensions/extensions.dart';

class TableWidget extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;

  const TableWidget({
    Key? key,
    required this.rows,
    required this.columns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: Get.height.percent(50),
      ),
      child: Scrollbar(
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Responsive.isMobile(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: 20,
                columns: columns
                    .map<DataColumn>(
                      (e) => DataColumn(
                        label: Text(
                          e.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(height: 0.3, fontSize: 13),
                        ),
                      ),
                    )
                    .toList(),
                rows: rows.map((e) => makeRow(context, e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow makeRow(BuildContext context, List e) => DataRow(
      cells: e
          .map(
            (e) => DataCell(
              Text(
                e.toString().toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.white),
              ),
            ),
          )
          .toList(),
    );
