import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart' as html;

import 'package:dash/core/utils/pdf_api.dart';
import 'package:dash/presentation/components/dash_loading.dart';

import '../../../../core/utils/responsive_util.dart';
import 'filter_on_data_widget.dart';

class HeaderTableWidget extends StatelessWidget {
  final String title;
  final bool isShowFilter;
  final bool isShowPdf;
  final List<List> data;
  final String dateFirst;
  final String dateLast;

  final Function(String) onSearch;
  final Function(String startDate, String endDate)? onFilter;
  const HeaderTableWidget({
    Key? key,
    required this.title,
    this.isShowFilter = false,
    this.isShowPdf = false,
    required this.data,
    required this.dateLast,
    required this.dateFirst,
    required this.onSearch,
    this.onFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: AutoSizeText(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.white,
                fontSize: Responsive.isMobile(context) ? 32 : 50),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 4,
          child: TextFormField(
            onChanged: (value) => onSearch(value),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 12,
              ),
              hintText: "Pesquisar",
              fillColor: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        Visibility(
          visible: isShowFilter,
          child: TextButton(
            onPressed: () => Get.dialog(FilterOnDataWidget(
              onFilter: (date) => onFilter?.call(date.startTime, date.endTime),
            )),
            child: Text('Filtrar'),
          ),
        ),
        SizedBox(width: 10),
        Visibility(
          visible: isShowPdf,
          child: TextButton(
            onPressed: () async {
              Get.dialog(DashLoading());
              final file = await PDF.generatePDF(
                data,
                fim: dateLast.isNotEmpty ? dateLast : null,
                inicio: dateFirst.isNotEmpty ? dateFirst : null,
              );
              Get.back();
              try {
                await PDF.openFile(file);
              } catch (e) {
                final blob = html.Blob([file], 'application/pdf');
                final url = html.Url.createObjectUrlFromBlob(blob);
                html.window.open(url, "_blank");
                html.Url.revokeObjectUrl(url);
              }
            },
            child: Text('Baixar PDF'),
          ),
        )
      ],
    );
  }
}
