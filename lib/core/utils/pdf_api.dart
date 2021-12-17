import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PDF {
  static Future<dynamic> generatePDF(
    List<List<dynamic>> epat, {
    String? inicio,
    String? fim,
  }) async {
    final pdf = Document();

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
    );
    pdf.addPage(MultiPage(
        pageTheme: pageTheme,
        maxPages: 200,
        header: (_) => Padding(
              padding: EdgeInsets.only(bottom: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getDateNow(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Campos & Barros",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
        build: (build) {
          return [
            SizedBox(height: 20),
            Container(
              child: Center(
                child: Text(
                  "Campos & Barros",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'EPAT',
                style: TextStyle(fontSize: 13),
              ),
              Text(
                inicio != null ? 'Com filtro' : 'Sem filtro',
                style: TextStyle(fontSize: 12),
              ),
            ]),
            SizedBox(height: 20),
            if (inicio != null)
              Row(
                children: [
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
                      child: Text("Inicio",
                          style: TextStyle(color: PdfColors.white)),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: PdfColors.grey100,
                      padding: EdgeInsets.all(13),
                      child: Text(inicio),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 10),
            if (fim != null)
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
                        Text("Fim", style: TextStyle(color: PdfColors.white)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: PdfColors.grey100,
                    padding: EdgeInsets.all(13),
                    child: Text(fim),
                  ),
                ),
              ]),
            SizedBox(height: 20),
            Table.fromTextArray(
              headers: <dynamic>[
                'AIIM',
                'DRT',
                'AUTUADO',
                'DATA AIIM',
              ],
              cellAlignment: Alignment.center,
              data: epat,
            )
          ];
        }));

    return saveDocument(name: 'my_exemplo.pdf', pdf: pdf);
  }

  static Future<dynamic> generatePGEPDF(
    List<List<dynamic>> pge, {
    String? inicio,
    String? fim,
  }) async {
    final pdf = Document();

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
    );
    pdf.addPage(MultiPage(
        pageTheme: pageTheme,
        maxPages: 200,
        header: (_) => Padding(
              padding: EdgeInsets.only(bottom: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getDateNow(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Campos & Barros",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
        build: (build) {
          return [
            SizedBox(height: 20),
            Container(
              child: Center(
                child: Text(
                  "Campos & Barros",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'PGE',
                style: TextStyle(fontSize: 13),
              ),
              Text(
                inicio != null ? 'Com filtro' : 'Sem filtro',
                style: TextStyle(fontSize: 12),
              ),
            ]),
            SizedBox(height: 20),
            if (inicio != null)
              Row(
                children: [
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
                      child: Text("Inicio",
                          style: TextStyle(color: PdfColors.white)),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: PdfColors.grey100,
                      padding: EdgeInsets.all(13),
                      child: Text(inicio),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 10),
            if (fim != null)
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
                        Text("Fim", style: TextStyle(color: PdfColors.white)),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: PdfColors.grey100,
                    padding: EdgeInsets.all(13),
                    child: Text(fim),
                  ),
                ),
              ]),
            SizedBox(height: 20),
            Table.fromTextArray(
              headers: <dynamic>[
                'NOME',
                'CNPJ',
                'PEP',
                'ORDINÁRIO',
                'TOTAL AUTUAÇÃO',
                'TOTAL DECLARADO',
                'MUNICÍPIO',
                'INDÚSTRIA',
              ],
              cellAlignment: Alignment.center,
              data: pge,
            )
          ];
        }));

    return saveDocument(name: 'my_exemplo_2.pdf', pdf: pdf);
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
