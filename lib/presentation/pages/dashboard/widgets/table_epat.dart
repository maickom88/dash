import 'package:dash/data/models/epat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/extensions.dart';

class TableEpatWidget extends StatelessWidget {
  final List<String> columns;
  final List<EpatModel> rows;
  final Function(String) onName;
  const TableEpatWidget({
    Key? key,
    required this.columns,
    required this.rows,
    required this.onName,
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
            DataTable(
              horizontalMargin: 0,
              columnSpacing: 20,
              columns: columns
                  .map<DataColumn>(
                    (e) => DataColumn(
                      label: TextButton(
                        onPressed: () {
                          onName(e);
                        },
                        child: Text(
                          e.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(height: 0.3, fontSize: 13),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              rows: rows.map((e) => makeRow(context, e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow makeRow(BuildContext context, EpatModel e) => DataRow(
      cells: [
        DataCell(
          Text(
            e.aiim == 'None' ? '-' : e.aiim.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            e.autuado == 'None' ? '-' : e.autuado.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            e.drt == 'None' ? '-' : e.drt.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            e.data == 'None' ? '-' : e.data.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            e.assunto == 'None' ? '-' : e.assunto.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
