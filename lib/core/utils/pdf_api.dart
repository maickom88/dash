import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PDF {
  static Future<dynamic> generatePDF() async {
    final pdf = Document();

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
    );

    pdf.addPage(MultiPage(
        pageTheme: pageTheme,
        header: (_) =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                getDateNow(),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "Encom Energia",
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ]),
        build: (build) {
          return [
            SizedBox(height: 20),
            Container(
              child: Center(
                child: Text(
                  'Encom Energia',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'SISTEMA DE MONITORAÇÃO REMOTA',
                style: TextStyle(fontSize: 13),
              ),
              Text(
                'CONTRATO 001/2013',
                style: TextStyle(fontSize: 12, color: PdfColors.red),
              ),
            ]),
            SizedBox(height: 20),
            Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: PdfColors.red400,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(13),
                  child: Text("Site", style: TextStyle(color: PdfColors.white)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: PdfColors.grey100,
                  padding: EdgeInsets.all(13),
                  child: Text("Edifício Sede - Sistema Y"),
                ),
              ),
            ]),
            SizedBox(height: 10),
            Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: PdfColors.red400,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(13),
                  child: Text("Supervisor",
                      style: TextStyle(color: PdfColors.white)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: PdfColors.grey100,
                  padding: EdgeInsets.all(13),
                  child: Text("16140114"),
                ),
              ),
            ]),
            SizedBox(height: 10),
            Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: PdfColors.red400,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(13),
                  child:
                      Text("Período", style: TextStyle(color: PdfColors.white)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: PdfColors.grey100,
                  padding: EdgeInsets.all(13),
                  child: Text("01/11/2018 à 30/11/2018"),
                ),
              ),
            ]),
            SizedBox(height: 20),
            Text(
              'EQUIPAMENTOS',
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(height: 10),
            Table.fromTextArray(
              headers: <dynamic>['N° Ordem', 'Descrição'],
              cellAlignment: Alignment.center,
              data: [
                ["GMG 500KVA Caterpillar Sistema Y", "141"]
              ],
            )
          ];
        }));

    return saveDocument(name: 'my_exemplo.pdf', pdf: pdf);
  }

  static Future<dynamic> saveDocument(
      {required String name, required Document pdf}) async {
    final bytes = await pdf.save();
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$name');
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      return bytes;
    }
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}

String getDateNow() {
  final date = DateTime.now();
  final day = date.day;
  final month = date.month;
  final year = date.year;
  var monthString;
  switch (month) {
    case 1:
      monthString = 'Janeiro';
      break;
    case 2:
      monthString = 'Fevereiro';
      break;
    case 3:
      monthString = 'Março';
      break;
    case 4:
      monthString = 'Abril';
      break;
    case 5:
      monthString = 'Maio';
      break;
    case 6:
      monthString = 'Junho';
      break;
    case 7:
      monthString = 'Julho';
      break;
    case 8:
      monthString = 'Agosto';
      break;
    case 9:
      monthString = 'Setembro';
      break;
    case 10:
      monthString = 'Outubro';
      break;
    case 11:
      monthString = 'Novembro';
      break;
    default:
      monthString = 'Dezembro';
  }

  return '$day $monthString, $year';
}
